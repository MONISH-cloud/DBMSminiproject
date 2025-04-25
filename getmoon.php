<?php
// Database connection details
$servername = "localhost:3306"; // usually localhost
$username = "root";             // your database username
$password = "monish777";        // your database password
$dbname = "COSMIC";             // the name of your database

// Create a connection to the MySQL database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch data from the Moons table
$sql = "SELECT * FROM Moons";
$result = $conn->query($sql);

// Check if any data was fetched
if ($result->num_rows > 0) {
    $moons = [];
    while ($row = $result->fetch_assoc()) {
        $moons[] = $row;
    }
    echo json_encode($moons);
} else {
    echo json_encode([]); // Return an empty array if no results
}

$conn->close();
?>
