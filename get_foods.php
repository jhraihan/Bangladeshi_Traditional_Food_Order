<?php
include 'config.php';

try {
    $sql = "SELECT * FROM food_items";
    $result = $conn->query($sql);

    $foods = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $foods[] = $row;
        }
    }

    echo json_encode($foods);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Failed to fetch food items"]);
}

$conn->close();
