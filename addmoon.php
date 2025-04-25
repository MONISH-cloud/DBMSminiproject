<?php
$servername = "localhost:3306";
$username = "root";
$password = "monish777";
$dbname = "COSMIC";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Validate required fields
if (
  isset($_POST['name']) && isset($_POST['planet_id']) &&
  isset($_POST['diameter']) && isset($_POST['distance']) &&
  isset($_POST['orbital_period'])
) {
  $name = $_POST['name'];
  $planet_id = $_POST['planet_id'];
  $diameter = $_POST['diameter'];
  $distance = $_POST['distance'];
  $orbital_period = $_POST['orbital_period'];

  // Generate new Moon_ID manually
  $result = $conn->query("SELECT MAX(Moon_ID) AS max_id FROM Moons");
  $row = $result->fetch_assoc();
  $new_id = $row['max_id'] + 1;
  if ($row['max_id'] === null) $new_id = 1;

  // Prepare insert statement
  $stmt = $conn->prepare("INSERT INTO Moons (Moon_ID, Name, Planet_ID, Diameter, Distance_From_Planet, Orbital_Period)
                          VALUES (?, ?, ?, ?, ?, ?)");
  $stmt->bind_param("isiddd", $new_id, $name, $planet_id, $diameter, $distance, $orbital_period);

  if ($stmt->execute()) {
    echo "✅ Moon added successfully with ID: $new_id";
  } else {
    echo "❌ Error: " . $stmt->error;
  }

  $stmt->close();
} else {
  echo "❗ Missing required input values.";
}

$conn->close();
?>
