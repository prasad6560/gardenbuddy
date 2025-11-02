<?php
// ✅ Show all errors for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// ✅ Include your DB connection
include('db.php');

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

// ✅ Check if required fields are present
if (!isset($_POST['email']) || !isset($_POST['password'])) {
    echo json_encode([
        "success" => false,
        "error_code" => "ERR_MISSING_FIELDS",
        "message" => "Email and password are required."
    ]);
    exit();
}

// ✅ Sanitize and trim input
$email = trim($conn->real_escape_string($_POST['email']));
$password = trim($conn->real_escape_string($_POST['password']));

// ✅ Prepare SQL query
$sql = "SELECT * FROM register WHERE email = ? AND password = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    echo json_encode([
        "success" => false,
        "error_code" => "ERR_SQL_PREPARE",
        "message" => "Database error: Failed to prepare statement."
    ]);
    exit();
}

// ✅ Bind parameters and execute
$stmt->bind_param("ss", $email, $password);
$stmt->execute();
$result = $stmt->get_result();

// ✅ Check if login is successful
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode([
        "success" => true,
        "message" => "Login successful",
        "username" => $row['name']
    ]);
} else {
    echo json_encode([
        "success" => false,
        "error_code" => "ERR_INVALID_CREDENTIALS",
        "message" => "Invalid email or password."
    ]);
}

// ✅ Close connections
$stmt->close();
$conn->close();
?>
