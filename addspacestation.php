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
$name                = $_POST['name'];
$type                = $_POST['type'];
$operational_status  = $_POST['operational_status'];
$orbit_type          = $_POST['orbit_type'];
$crew_capacity       = $_POST['crew_capacity'];
$first_operational_date = $_POST['first_operational_date'];

// ✅ Prepare SQL insert statement (do not include Station_ID since it's auto-incremented)
$sql = "INSERT INTO SpaceStations (Name, Operational_Status, Orbit_Type, Crew_Capacity, First_Operational_Date)
        VALUES (?, ?, ?, ?, ?)";

// 🔒 Secure insert
$stmt = $conn->prepare($sql);

// 🔨 Fix bind_param to match the correct types
$stmt->bind_param("ssssi", $name, $operational_status, $orbit_type, $crew_capacity, $first_operational_date);

// ✅ Execute and respond
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Space Station added successfully!"]);
} else {
    echo json_encode(["success" => false, "error" => "Failed to add space station: " . $stmt->error]);
}

// 🔚 Close connections
$stmt->close();
$conn->close();
?>
