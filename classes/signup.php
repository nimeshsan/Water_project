<?php
// Include the database connection file
include 'db_connection.php';

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate form data (You can add more validation here)
    $name = $_POST['name'];
    $code = $_POST['code'];
    $email = $_POST['email'];
    $gender = $_POST['gender'];
    $birthday = $_POST['birthday'];

    // SQL query to check if the code already exists
    $check_query = "SELECT COUNT(*) AS count FROM members WHERE code = '$code'";
    $check_result = $conn->query($check_query);
    $row = $check_result->fetch_assoc();
    if ($row['count'] > 0) {
        echo "Error: Code already exists";
    } else {
        // SQL query to insert data into 'members' table
        $sql = "INSERT INTO members (name, code, email, gender, birthday) VALUES ('$name', '$code', '$email', '$gender', '$birthday')";

        if ($conn->query($sql) === TRUE) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
} else {
    echo "Form not submitted.";
}

// Close connection
$conn->close();
?>
