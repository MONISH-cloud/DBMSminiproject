<?php
header('Content-Type: application/json');

$servername = "localhost:3306";
$username = "root";
$password = "monish777";
$dbname = "COSMIC";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

$sql = "SELECT stars.Name AS star_name, galaxies.Name AS galaxy_name
        FROM stars
        JOIN galaxies ON stars.Galaxy_ID = galaxies.Galaxy_ID";

$result = $conn->query($sql);

$data = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode($data);

$conn->close();
?>
