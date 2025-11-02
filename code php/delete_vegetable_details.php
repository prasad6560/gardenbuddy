<?php
include('db.php');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['vegetable_id'])) {
        $vegetable_id = $_POST['vegetable_id'];

        $stmt = $conn->prepare("DELETE FROM vegetabledetails WHERE vegetable_id = ?");
        $stmt->bind_param("i", $vegetable_id);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Vegetable details deleted successfully"]);
        } else {
            echo json_encode(["success" => false, "message" => "Failed to delete"]);
        }

        $stmt->close();
        $conn->close();
    } else {
        echo json_encode(["success" => false, "message" => "Missing vegetable_id"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}
?>
