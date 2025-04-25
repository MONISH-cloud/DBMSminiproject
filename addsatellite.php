<?php
header('Content-Type: application/json');

// ✅ Database configuration
$host = "localhost:3306";
$user = "root";
$pass = "monish777"; // default password is empty in XAMPP
$db   = "COSMIC";

// 🔌 Connect to the database
$conn = new mysqli($host, $user, $pass, $db);

// ❌ Check connection
if ($conn->connect_error) {
    echo json_encode(["success" => false, "error" => "Database connection failed"]);
    exit();
}

// ✅ Get POST data
$name        = $_POST['name'];
$type        = $_POST['type'];
$launch_date = $_POST['launch_date'];
$orbit_type  = $_POST['orbit_type'];
$operator    = $_POST['operator'];
$status      = $_POST['status'];

// ✅ Get next Satellite_ID
$sql_max_id = "SELECT MAX(Satellite_ID) AS max_id FROM Satellites";
$result = $conn->query($sql_max_id);

if ($result) {
    $row = $result->fetch_assoc();
    $new_satellite_id = $row['max_id'] + 1;
} else {
    $new_satellite_id = 1;
}

// ✅ Prepare insert statement
$sql = "INSERT INTO Satellites (Satellite_ID, Name, Type, Launch_Date, Orbit_Type, Operator, Status)
        VALUES (?, ?, ?, ?, ?, ?, ?)";

// 🔒 Use prepared statement
$stmt = $conn->prepare($sql);
$stmt->bind_param("issssss", $new_satellite_id, $name, $type, $launch_date, $orbit_type, $operator, $status);

// ✅ Execute and respond
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Satellite added successfully!"]);
} else {
    echo json_encode(["success" => false, "error" => "Failed to add satellite: " . $stmt->error]);
}

// 🔚 Close connections
$stmt->close();
$conn->close();
?>
