<?php
$servername = "localhost:3306";
$username = "root";
$password = "monish777";
$dbname = "COSMIC";

// Create MySQL connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check for connection error
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get search input
$name = isset($_GET['name']) ? $_GET['name'] : '';
$name = $conn->real_escape_string($name);

// Query the Satellites table
$sql = "SELECT * FROM Satellites WHERE Name LIKE '%$name%'";
$result = $conn->query($sql);

// Collect results
$results = [];

if ($result && $result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $results[] = $row;
  }
}

// Return data as JSON
echo json_encode($results);

$conn->close();
?>
