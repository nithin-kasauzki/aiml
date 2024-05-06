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
}

function addPatient($conn) {
    $sql = "INSERT INTO PATIENT (Pid, Pname, DOB, ContactNo, Address) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['pid'], $_POST['pname'], $_POST['dob'], $_POST['contactNo'], $_POST['address']]);
    echo "New patient added.<br>";
}

function addDiagnosis($conn) {
    $sql = "INSERT INTO DIAGNOSIS (Did, Dname, Medication, Department) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['did'], $_POST['dname'], $_POST['medication'], $_POST['department']]);
    echo "New diagnosis added.<br>";
}

function assignTreatment($conn) {
    $sql = "INSERT INTO TREATMENT (Pid, Type, Did, DoctorName) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['pid'], $_POST['type'], $_POST['did'], $_POST['doctorName']]);
    echo "Treatment assigned to patient.<br>";
}

function updatePatient($conn) {
    $sql = "UPDATE PATIENT SET Pname = ?, DOB = ?, ContactNo = ?, Address = ? WHERE Pid = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['pname'], $_POST['dob'], $_POST['contactNo'], $_POST['address'], $_POST['pid']]);
    echo "Patient record updated.<br>";
}

function deletePatient($conn) {
    $sql = "DELETE FROM PATIENT WHERE Pid = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['pid']]);
    echo "Patient record deleted.<br>";
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    switch ($_POST['formType']) {
        case 'addPatient':
            addPatient($conn);
            break;
        case 'addDiagnosis':
            addDiagnosis($conn);
            break;
        case 'assignTreatment':
            assignTreatment($conn);
            break;
        case 'updatePatient':
            updatePatient($conn);
            break;
        case 'deletePatient':
            deletePatient($conn);
            break;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
</head>
<body>
    <h2>Add Patient</h2>
    <form method="post">
        <input type="hidden" name="formType" value="addPatient">
        Pid: <input type="text" name="pid"><br>
        Pname: <input type="text" name="pname"><br>
        DOB: <input type="date" name="dob"><br>
        ContactNo: <input type="text" name="contactNo"><br>
        Address: <input type="text" name="address"><br>
        <input type="submit" value="Add Patient">
    </form>

    <h2>Add Diagnosis</h2>
    <form method="post">
        <input type="hidden" name="formType" value="addDiagnosis">
        Did: <input type="text" name="did"><br>
        Dname: <input type="text" name="dname"><br>
        Medication: <input type="text" name="medication"><br>
        Department: <input type="text" name="department"><br>
        <input type="submit" value="Add Diagnosis">
    </form>

    <h2>Assign Treatment</h2>
    <form method="post">
        <input type="hidden" name="formType" value="assignTreatment">
        Pid: <input type="text" name="pid"><br>
        Type: <input type="text" name="type"><br>
        Did: <input type="text" name="did"><br>
        DoctorName: <input type="text" name="doctorName"><br>
        <input type="submit" value="Assign Treatment">
    </form>

    <h2>Update Patient</h2>
    <form method="post">
        <input type="hidden" name="formType" value="updatePatient">
        Pid: <input type="text" name="pid" required><br>
        Pname: <input type="text" name="pname"><br>
        DOB: <input type="date" name="dob"><br>
        ContactNo: <input type="text" name="contactNo"><br>
        Address: <input type="text" name="address"><br>
        <input type="submit" value="Update Patient">
    </form>

    <h2>Delete Patient</h2>
    <form method="post">
        <input type="hidden" name="formType" value="deletePatient">
        Pid: <input type="text" name="pid" required><br>
        <input type="submit" value="Delete Patient">
    </form>
    <a href="bout.php">Tables</a>
    
</body>
</html>
