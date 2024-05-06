<?php
$servername = "localhost";
$username = "user";
$password = 'pass';
$dbname = "AppLab";

// Create connection
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    die();
}

// Function to fetch and display table data
function displayTable($conn, $tableName) {
    $stmt = $conn->prepare("SELECT * FROM $tableName");
    $stmt->execute();

    // Set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $rows = $stmt->fetchAll();

    echo "<h3>$tableName</h3>";
    echo "<table border='1'><tr>";
    // Header
    foreach ($rows[0] as $key => $value) {
        echo "<th>$key</th>";
    }
    echo "</tr>";
    // Data
    foreach ($rows as $row) {
        echo "<tr>";
        foreach ($row as $data) {
            echo "<td>$data</td>";
        }
        echo "</tr>";
    }
    echo "</table><br>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        
        table { border-collapse: collapse; margin-right: 20px; }
        th, td { padding: 8px; text-align: left; border-bottom: 1px solid #ddd; }
    </style>
    <title>Display Tables</title>
</head>
<body>
    <div>
        <?php
        displayTable($conn, "PATIENT");
        displayTable($conn, "DIAGNOSIS");
        displayTable($conn, "TREATMENT");
        ?>
    </div>
</body>
</html>
