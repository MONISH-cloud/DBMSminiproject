<?php
header('Content-Type: application/json');

// ✅ Database configuration
$host = "localhost:3306";
$user = "root";
$pass = "monish777";
$db   = "COSMIC";

// 🔌 Connect to the database
$conn = new mysqli($host, $user, $pass, $db);

// ❌ Check connection
if ($conn->connect_error) {
    echo json_encode(["success" => false, "error" => "Database connection failed"]);
    exit();
}

// ✅ Get POST data from form
$name        = $_POST['name'];
$galaxy_id   = $_POST['galaxy_id'];
$type        = $_POST['type'];
$mass        = $_POST['mass'];
$luminosity  = $_POST['luminosity'];
$temperature = $_POST['temperature'];
$age         = $_POST['age'];

// ✅ Get the next Star_ID (find max value and increment by 1)
$sql_max_id = "SELECT MAX(Star_ID) AS max_id FROM stars";
$result = $conn->query($sql_max_id);

if ($result) {
    $row = $result->fetch_assoc();
    $new_star_id = $row['max_id'] + 1;
} else {
    $new_star_id = 1; // Start from 1 if table is empty
}

// ✅ Prepare SQL insert
$sql = "INSERT INTO stars (Star_ID, Name, Galaxy_ID, Type, Mass, Luminosity, Temperature, Age)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

// 🔒 Secure insert
$stmt = $conn->prepare($sql);
$stmt->bind_param("isisdddd", $new_star_id, $name, $galaxy_id, $type, $mass, $luminosity, $temperature, $age);

// ✅ Execute and respond
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Star added successfully!"]);
} else {
    echo json_encode(["success" => false, "error" => "Failed to add star: " . $stmt->error]);
}

// 🔚 Close connections
$stmt->close();
$conn->close();
?>
