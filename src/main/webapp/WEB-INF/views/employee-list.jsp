<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between mb-3">
        <h2>Employee List</h2>
        <a href="employee-form.jsp" class="btn btn-primary">Add Employee</a>
    </div>

    <div class="mb-3">
        <input type="text" id="searchBox" class="form-control" placeholder="Search by name...">
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>DOB</th>
                    <th>Age</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="employeeTableBody"></tbody>
        </table>
    </div>

    <nav>
        <ul class="pagination" id="pagination"></ul>
    </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="script.js"></script>
</body>
</html>
