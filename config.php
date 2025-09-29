<?php
// Enable error reporting but don't display errors in production
error_reporting(E_ALL);
ini_set('display_errors', 0); // Set to 1 for debugging, 0 for production

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);
}

$host = "localhost";
$username = "root";
$password = "";
$database = "food_ordering";

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "Database connection failed"]);
    exit;
}
// Start session for PHP authentication
session_start();

// Simple authentication check function
function checkAuth($requiredRole = null)
{
    if (!isset($_SESSION['user'])) {
        http_response_code(401);
        echo json_encode(["error" => "Unauthorized"]);
        exit;
    }

    if ($requiredRole && $_SESSION['user']['role'] !== $requiredRole) {
        http_response_code(403);
        echo json_encode(["error" => "Forbidden"]);
        exit;
    }

    return true;
}
