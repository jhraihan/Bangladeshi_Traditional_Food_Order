<?php
include 'config.php';

try {
    // Check if orders table exists
    $table_check = $conn->query("SHOW TABLES LIKE 'orders'");
    if ($table_check->num_rows == 0) {
        echo json_encode([]);
        exit;
    }

    $sql = "SELECT o.*, 
            (SELECT GROUP_CONCAT(CONCAT(oi.quantity, ' x ', oi.food_name) SEPARATOR ', ') 
             FROM order_items oi 
             WHERE oi.order_id = o.id) as items
            FROM orders o 
            ORDER BY o.created_at DESC";

    $result = $conn->query($sql);

    $orders = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $orders[] = $row;
        }
    }

    echo json_encode($orders);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Failed to fetch orders"]);
}

$conn->close();
