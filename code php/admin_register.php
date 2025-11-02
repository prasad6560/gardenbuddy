<?php
include('db.php');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['password'])) {
        $name = $conn->real_escape_string($_POST['name']);
        $email = $conn->real_escape_string($_POST['email']);
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Secure password

        // Check if email already exists
        $emailCheck = $conn->prepare("SELECT id FROM admin_register WHERE email = ?");
        $emailCheck->bind_param("s", $email);
        $emailCheck->execute();
        $emailCheckResult = $emailCheck->get_result();

        if ($emailCheckResult->num_rows > 0) {
            echo json_encode(["success" => false, "message" => "Email ID already exists."]);
        } else {
            // Insert data
            $stmt = $conn->prepare("INSERT INTO admin_register (name, email, password) VALUES (?, ?, ?)");
            $stmt->bind_param("sss", $name, $email, $password);

            if ($stmt->execute()) {
                $last_id = $conn->insert_id;
                $result = $conn->query("SELECT id, name, email FROM admin_register WHERE id = $last_id");

                if ($result && $row = $result->fetch_assoc()) {
                    echo json_encode(["success" => true, "message" => "Admin registered successfully.", "data" => $row]);
                } else {
                    echo json_encode(["success" => false, "message" => "Error fetching inserted data."]);
                }
            } else {
                echo json_encode(["success" => false, "message" => "Error: " . $conn->error]);
            }
        }
    } else {
        echo json_encode(["success" => false, "message" => "Invalid input or missing required fields."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method. Use POST."]);
}

$conn->close();
?>
