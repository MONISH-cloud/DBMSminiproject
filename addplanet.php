<?php
header('Content-Type: application/json');

// ✅ Database configuration
$host = "localhost:3306";
$user = "root";
$pass = "monish777"; // default password is empty in XAMPP
$db   = "COSMIC"; // change if your DB name is different

// 🔌 Connect to the database
$conn = new mysqli($host, $user, $pass, $db);

// ❌ Check connection
if ($conn->connect_error) {
    echo json_encode(["success" => false, "error" => "Database connection failed"]);
    exit();
}

// ✅ Get POST data from form
$name            = $_POST['name'];
$star_id         = $_POST['star_id'];
$type            = $_POST['type'];
$atmosphere      = $_POST['atmosphere'];
$distance        = $_POST['distance'];
$orbital_period  = $_POST['orbital_period'];
$temperature     = $_POST['temperature'];

// ✅ Get the next Planet_ID (find max value and increment by 1)
$sql_max_id = "SELECT MAX(Planet_ID) AS max_id FROM planets";
$result = $conn->query($sql_max_id);

if ($result) {
    $row = $result->fetch_assoc();
    $new_planet_id = $row['max_id'] + 1; // Increment the max value by 1
} else {
    $new_planet_id = 1; // Start from 1 if the table is empty
}

// ✅ Prepare the SQL insert statement (include the manually generated Planet_ID)
$sql = "INSERT INTO planets (Planet_ID, name, star_id, type, atmosphere, distance_from_star, orbital_period, surface_temperature)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

// 🔒 Use prepared statement for security
$stmt = $conn->prepare($sql);
$stmt->bind_param("isisiidd", $new_planet_id, $name, $star_id, $type, $atmosphere, $distance, $orbital_period, $temperature);

// ✅ Execute and respond
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Planet added successfully!"]);
} else {
    echo json_encode(["success" => false, "error" => "Failed to add planet: " . $stmt->error]);
}

// 🔚 Close connections
$stmt->close();
$conn->close();
?>
