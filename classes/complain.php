<?php
// Include the database connection file
include 'db_connection.php';

// Retrieve form data
$name = $_POST['name'];
$code = $_POST['code'];
$email = $_POST['email'];
$complaint = $_POST['complaint'];

// Prepare and execute SQL query to check credentials
$sql = "SELECT * FROM members WHERE name=? AND code=? AND email=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $name, $code, $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // User found, insert complaint into database
    // Prepare SQL statement to insert data
    $sql = "INSERT INTO UserComplains (name, code, email, complaint) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $name, $code, $email, $complaint);
    if ($stmt->execute()) {
        echo "Complaint sent successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    // User not found, display error message or redirect to login page
    echo "Invalid credentials!";
    // You can redirect to login page using header() function
    // header("Location: index.php");
}

$stmt->close();
$conn->close();
?>
