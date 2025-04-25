<?php
// Database connection details
$servername = "localhost:3306"; // usually localhost
$username = "root";             // your database username
$password = "monish777";        // your database password (default is empty for XAMPP/WAMP)
$dbname = "COSMIC";             // the name of your database

// Create a connection to the MySQL database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch data from the galaxies table
$sql = "SELECT * FROM Galaxies"; // your table name
$result = $conn->query($sql);

// Check if any data was fetched
if ($result->num_rows > 0) {
    // Output data of each row
    $galaxies = [];
    while ($row = $result->fetch_assoc()) {
        $galaxies[] = $row;
    }
    // Return the data as JSON
    echo json_encode($galaxies);
} else {
    echo json_encode([]); // Return an empty array if no results
}

$conn->close();
?>
