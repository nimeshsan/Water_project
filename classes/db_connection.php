<?php
// Database credentials
$servername = "localhost"; // If your database is hosted on a different server, replace "localhost" with the appropriate hostname
$username = "root"; // Replace "your_username" with your MySQL username
$password = ""; // Replace "your_password" with your MySQL password
$database = "water_db"; // Replace "your_database" with the name of your MySQL database

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    //echo "Connected successfully";
}

// Close connection (optional)
//$conn->close();
?>
