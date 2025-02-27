<?php
// Include the database connection file
include 'db_connection.php';

// Retrieve form data
$name = $_POST['name'];
$code = $_POST['code'];
$email = $_POST['email'];

// Prepare and execute SQL query to check credentials
$sql = "SELECT * FROM members WHERE name='$name' AND code='$code' AND email='$email'";
$result = $conn->query($sql) or die(mysqli_error($conn));

if ($result->num_rows > 0) {
    // User exists, redirect to success page or do further processing
    echo "Login successful!";
    // You can redirect to another page using header() function
    // header("Location: success.php");
} else {
    // User not found, display error message or redirect to login page
    echo "Invalid credentials!";
    // You can redirect to login page using header() function
    // header("Location: index.php");
}

$conn->close();
?>
