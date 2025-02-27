<?php
// Include the database connection file
include 'db_connection.php';

// Check if the required POST data is present
if (isset($_POST['name'], $_POST['email'], $_POST['code'], $_POST['amount'], $_POST['month'])) {
    // Retrieve form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $code = $_POST['code'];
    $amount = $_POST['amount'];
    $month = $_POST['month'];

    // Prepare and execute SQL query to check credentials
    $sql = "SELECT * FROM members WHERE name=? AND code=? AND email=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $name, $code, $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // User found, insert complaint into database
        // Prepare SQL statement to insert data
        $sql = "INSERT INTO bill_paid (name, email, code, amount, month) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssss", $name, $email, $code, $amount, $month);
        if ($stmt->execute()) {
            echo "Payment successfully!";
        } else {
            echo "Error: " . $stmt->error;
        }
    } else {
        // User not found, display error message or redirect to login page
        echo "Invalid credentials!";
        // You can redirect to login page using header() function
        // header("Location: index.php");
    }

    $stmt->close();
} else {
    echo "All fields are required!";
}

$conn->close();
?>
