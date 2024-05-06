<!DOCTYPE html>
<html>
<head>
    <title>Insert Employee</title>
</head>
<body>
    <h1>Insert Employee</h1>
    <form action="insertAction.jsp" method="post">
        <label for="eid">Employee ID:</label>
        <input type="text" id="eid" name="eid"><br>
        <label for="ename">Employee Name:</label>
        <input type="text" id="ename" name="ename"><br>
        <label for="dept">Department:</label>
        <input type="text" id="dept" name="dept"><br>
        <label for="doj">Date of Joining:</label>
        <input type="date" id="doj" name="doj"><br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="salary"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
