<?php
include('db.php');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (
        isset($_POST['register_id']) &&
        isset($_POST['overall_experience']) &&
        isset($_POST['user_friendly']) &&
        isset($_POST['helpful_features']) &&
        isset($_POST['tips_accuracy']) &&
        isset($_POST['recommendation_rating'])
    ) {
        $register_id = (int)$_POST['register_id'];
        $overall_experience = $conn->real_escape_string($_POST['overall_experience']);
        $user_friendly = $conn->real_escape_string($_POST['user_friendly']);

        // Convert array to string for DB
        if (is_array($_POST['helpful_features'])) {
            $helpful_features = implode(', ', array_map([$conn, 'real_escape_string'], $_POST['helpful_features']));
        } else {
            $helpful_features = $conn->real_escape_string($_POST['helpful_features']);
        }

        $tips_accuracy = $conn->real_escape_string($_POST['tips_accuracy']);
        $recommendation_rating = (int)$_POST['recommendation_rating'];

        // Optional feedback field
        $feedback = isset($_POST['feedback']) ? $conn->real_escape_string($_POST['feedback']) : null;

        // Check if register_id exists
        $userCheck = $conn->prepare("SELECT id FROM register WHERE id = ?");
        $userCheck->bind_param("i", $register_id);
        $userCheck->execute();
        $userResult = $userCheck->get_result();

        if ($userResult->num_rows === 0) {
            echo json_encode(["success" => false, "message" => "User not found. Please register first."]);
            exit;
        }

        // Check for duplicate feedback
        $checkSql = "SELECT id FROM feedback WHERE 
                     register_id = ? AND
                     overall_experience = ? AND
                     user_friendly = ? AND
                     helpful_features = ? AND
                     tips_accuracy = ? AND
                     recommendation_rating = ?";
        $stmt = $conn->prepare($checkSql);
        $stmt->bind_param("issssi", $register_id, $overall_experience, $user_friendly, $helpful_features, $tips_accuracy, $recommendation_rating);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result && $result->num_rows > 0) {
            echo json_encode(["success" => false, "message" => "Feedback already submitted."]);
        } else {
            // Insert feedback
            $sql = "INSERT INTO feedback (register_id, overall_experience, user_friendly, helpful_features, tips_accuracy, recommendation_rating, feedback)
                    VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("issssis", $register_id, $overall_experience, $user_friendly, $helpful_features, $tips_accuracy, $recommendation_rating, $feedback);

            if ($stmt->execute()) {
                $last_id = $conn->insert_id;
                $result = $conn->query("SELECT * FROM feedback WHERE id = $last_id");

                if ($result && $row = $result->fetch_assoc()) {
                    $row['helpful_features'] = !empty($row['helpful_features']) ? explode(', ', $row['helpful_features']) : [];
                    echo json_encode(["success" => true, "message" => "Feedback submitted successfully.", "data" => $row]);
                } else {
                    echo json_encode(["success" => false, "message" => "Error fetching inserted data."]);
                }
            } else {
                echo json_encode(["success" => false, "message" => "Insert failed: " . $conn->error]);
            }
        }
    } else {
        echo json_encode(["success" => false, "message" => "Missing required fields."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method. Use POST."]);
}

$conn->close();
?>
