<?php
header('Content-Type: application/json');

// ✅ Database configuration
$host = "localhost:3306";
$user = "root";
$pass = "monish777"; // default password is empty in XAMPP
$db   = "COSMIC";    // make sure this matches your database name

// 🔌 Connect to the database
$conn = new mysqli($host, $user, $pass, $db);

// ❌ Check connection
if ($conn->connect_error) {
    echo json_encode(["success" => false, "error" => "Database connection failed"]);
    exit();
}

// ✅ Get POST data from form
$name              = $_POST['name'];
$orbit_type        = $_POST['orbit_type'];
$composition       = $_POST['composition'];
$closest_approach  = $_POST['closest_approach'];
$tail_length       = $_POST['tail_length'];

// ✅ Get the next Comet_ID (find max value and increment by 1)
$sql_max_id = "SELECT MAX(Comet_ID) AS max_id FROM Comets";
$result = $conn->query($sql_max_id);

if ($result) {
    $row = $result->fetch_assoc();
    $new_comet_id = $row['max_id'] + 1; // Increment the max value by 1
} else {
    $new_comet_id = 1; // Start from 1 if the table is empty
}

// ✅ Prepare the SQL insert statement (include the manually generated Comet_ID)
$sql = "INSERT INTO Comets (Comet_ID, Name, Orbit_Type, Composition, Closest_Approach_To_Sun, Tail_Length)
        VALUES (?, ?, ?, ?, ?, ?)";

// 🔒 Use prepared statement for security
$stmt = $conn->prepare($sql);
$stmt->bind_param("isssdd", $new_comet_id, $name, $orbit_type, $composition, $closest_approach, $tail_length);

// ✅ Execute and respond
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Comet added successfully!"]);
} else {
    echo json_encode(["success" => false, "error" => "Failed to add comet: " . $stmt->error]);
}

// 🔚 Close connections
$stmt->close();
$conn->close();
?>
