<?php
$servername = "localhost:3306";
$username = "root";
$password = "monish777";
$dbname = "COSMIC";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$name = isset($_GET['name']) ? $_GET['name'] : '';
$name = $conn->real_escape_string($name);

$sql = "SELECT * FROM planets WHERE Name LIKE '%$name%'";
$result = $conn->query($sql);

$results = [];

if ($result && $result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $results[] = $row;
  }
}

echo json_encode($results);

$conn->close();
?>
