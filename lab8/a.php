<?php
$servername = "localhost";
$username = "user";
$password = 'pass';
$dbname = "AppLab";

$conn = null;

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

function addStudent($conn) {
    $sql = "INSERT INTO STUDENT VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['rollno'], $_POST['name'], $_POST['branch'], $_POST['year'], $_POST['cgpa'], $_POST['dob'], $_POST['emailID']]);
    echo "New student added.<br>";
}

function addCourse($conn) {
    $sql = "INSERT INTO COURSES (Cid, Cname, FacultyName) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['cid'], $_POST['cname'], $_POST['facultyName']]);
    echo "New course added.<br>";
}

function assignCourse($conn) {
    $sql = "INSERT INTO COURSE_TAKEN (Rollno, Cid) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['rollno'], $_POST['cid']]);
    echo "Course assigned to student.<br>";
}

function updateStudent($conn) {
    $sql = "UPDATE STUDENT SET Name = ? WHERE Rollno = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['name'], $_POST['rollno']]);
    echo "Student record updated.<br>";
}

function deleteStudent($conn) {
    $sql = "DELETE FROM STUDENT WHERE Rollno = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$_POST['rollno']]);
    echo "Student record deleted.<br>";
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['action'])) {
        switch ($_POST['action']) {
            case 'Add Student':
                addStudent($conn);
                break;
            case 'Add Course':
                addCourse($conn);
                break;
            case 'Assign Course':
                assignCourse($conn);
                break;
            case 'Update Student':
                updateStudent($conn);
                break;
            case 'Delete Student':
                deleteStudent($conn);
                break;
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>University Database Management</title>
</head>
<body>

<h2>Add Student</h2>
<form method="post">
    Roll No: <input type="text" name="rollno"><br>
    Name: <input type="text" name="name"><br>
    Branch: <input type="text" name="branch"><br>
    Year: <input type="text" name="year"><br>
    CGPA: <input type="text" name="cgpa"><br>
    DOB: <input type="text" name="dob"><br>
    Email ID: <input type="text" name="emailID"><br>
    <input type="submit" name="action" value="Add Student">
</form>

<h2>Add Course</h2>
<form method="post">
    Course ID: <input type="text" name="cid"><br>
    Course Name: <input type="text" name="cname"><br>
    Faculty Name: <input type="text" name="facultyName"><br>
    <input type="submit" name="action" value="Add Course">
</form>

<h2>Assign Course to Student</h2>
<form method="post">
    Roll No: <input type="text" name="rollno"><br>
    Course ID: <input type="text" name="cid"><br>
    <input type="submit" name="action" value="Assign Course">
</form>

<h2>Update Student Info</h2>
<form method="post">
    Roll No: <input type="text" name="rollno"><br>
    New Name: <input type="text" name="name"><br>
    <input type="submit" name="action" value="Update Student">
</form>

<h2>Delete Student</h2>
<form method="post">
    Roll No: <input type="text" name="rollno"><br>
    <input type="submit" name="action" value="Delete Student">
</form>

</body>
</html>
