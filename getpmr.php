<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername = "localhost:3306";
$username = "root";
$password = "monish777";
$dbname = "COSMIC";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); // Output error and stop
}

$query = "
    SELECT
        p.Name AS planet_name,
        m.Name AS moon_name
    FROM planets p
    LEFT JOIN moons m ON p.Planet_ID = m.Planet_ID
";

$result = $conn->query($query);

$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    header('Content-Type: application/json'); // Ensure correct header
    echo json_encode($data);
} else {
    header('Content-Type: application/json'); // Ensure correct header
    echo json_encode([]);
}

$conn->close();
?>