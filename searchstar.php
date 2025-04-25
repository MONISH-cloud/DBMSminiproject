<?php
// Database connection details
$servername = "localhost:3306";
$username = "root";
$password = "monish777";
$dbname = "COSMIC";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get search query from URL
$name = isset($_GET['name']) ? $_GET['name'] : '';
$name = $conn->real_escape_string($name);

// SQL query to search for stars by name
$sql = "SELECT * FROM Stars WHERE Name LIKE '%$name%'";
$result = $conn->query($sql);

$stars = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $stars[] = $row;
    }
} 

// Return results as JSON
echo json_encode($stars);

$conn->close();
?>
