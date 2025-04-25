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
  isset($_POST['name']) && isset($_POST['galaxy_id']) && isset($_POST['composition']) &&
  isset($_POST['diameter']) && isset($_POST['velocity']) && isset($_POST['closest_approach'])
) {
  $name = $_POST['name'];
  $galaxy_id = $_POST['galaxy_id'];
  $composition = $_POST['composition'];
  $diameter = $_POST['diameter'];
  $velocity = $_POST['velocity'];
  $closest_approach = $_POST['closest_approach'];

  // Generate new Asteroid_ID manually
  $result = $conn->query("SELECT MAX(Asteroid_ID) AS max_id FROM Asteroids");
  $row = $result->fetch_assoc();
  $new_id = $row['max_id'] + 1;
  if ($new_id === null) $new_id = 1; // If table is empty

  // Prepare insert statement
  $stmt = $conn->prepare("INSERT INTO Asteroids (Asteroid_ID, Name, Galaxy_ID, Composition, Diameter, Velocity, Closest_Approach_To_Earth) 
                          VALUES (?, ?, ?, ?, ?, ?, ?)");
  $stmt->bind_param("isissdd", $new_id, $name, $galaxy_id, $composition, $diameter, $velocity, $closest_approach);

  if ($stmt->execute()) {
    echo "✅ Asteroid added successfully with ID: $new_id";
  } else {
    echo "❌ Error: " . $stmt->error;
  }

  $stmt->close();
} else {
  echo "❗ Missing required input values.";
}

$conn->close();
?>
