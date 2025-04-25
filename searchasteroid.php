<?php
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

// Get the search parameter from the URL
$name = isset($_GET['name']) ? $_GET['name'] : '';
$name = $conn->real_escape_string($name);

// Query the Asteroids table based on partial match
$sql = "SELECT * FROM Asteroids WHERE Name LIKE '%$name%'";
$result = $conn->query($sql);

$results = [];

if ($result && $result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $results[] = $row;
  }
}

// Return the result as JSON
echo json_encode($results);

$conn->close();
?>
