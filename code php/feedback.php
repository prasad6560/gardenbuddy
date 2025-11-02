<?php
// Include database connection
include('db.php');
header('Content-Type: application/json');

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate inputs
    if (
        isset($_POST['overall_experience']) &&
        isset($_POST['user_friendly']) &&
        isset($_POST['helpful_features']) &&
        isset($_POST['tips_accuracy']) &&
        isset($_POST['recommendation_rating']) &&
        isset($_POST['feedback']) // optional: add if feedback text is included
    ) {
        // Sanitize input
        $overall_experience = $conn->real_escape_string($_POST['overall_experience']);
        $user_friendly = $conn->real_escape_string($_POST['user_friendly']);
        $helpful_features = is_array($_POST['helpful_features']) ? implode(', ', $_POST['helpful_features']) : $_POST['helpful_features'];
        $tips_accuracy = $conn->real_escape_string($_POST['tips_accuracy']);
        $recommendation_rating = (int) $_POST['recommendation_rating'];
        $feedback = $conn->real_escape_string($_POST['feedback']);

        // Insert data into the feedback table
        $sql = "INSERT INTO feedback 
                (overall_experience, user_friendly, helpful_features, tips_accuracy, recommendation_rating, feedback, created_at) 
                VALUES (?, ?, ?, ?, ?, ?, NOW())";

        // Use prepared statements for safety
        $stmt = $conn->prepare($sql);
        if ($stmt) {
            $stmt->bind_param("ssssss", $overall_experience, $user_friendly, $helpful_features, $tips_accuracy, $recommendation_rating, $feedback);

            if ($stmt->execute()) {
                echo json_encode(array("success" => true, "message" => "Feedback submitted successfully."));
            } else {
                echo json_encode(array("success" => false, "message" => "Execution failed: " . $stmt->error));
            }

            $stmt->close();
        } else {
            echo json_encode(array("success" => false, "message" => "Preparation failed: " . $conn->error));
        }

    } else {
        echo json_encode(array("success" => false, "message" => "All fields are required."));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Invalid request method. Use POST."));
}

$conn->close();
?>
