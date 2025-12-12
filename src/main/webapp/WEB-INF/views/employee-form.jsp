<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 id="form-title">Add Employee</h4>
        </div>
        <div class="card-body">
            <form id="employeeForm" novalidate>
                <input type="hidden" id="employeeId">

                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">First Name *</label>
                        <input type="text" class="form-control" id="firstName" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Last Name *</label>
                        <input type="text" class="form-control" id="lastName" required>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>

                <div class="row g-3 mt-2">
                    <div class="col-md-4">
                        <label for="dateOfBirth" class="form-label">DOB *</label>
                        <input type="date" class="form-control" id="dateOfBirth" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="col-md-2">
                        <label for="age" class="form-label">Age</label>
                        <input type="text" class="form-control" id="age" readonly>
                    </div>
                    <div class="col-md-6">
                        <label for="mobile" class="form-label">Mobile *</label>
                        <input type="text" class="form-control" id="mobile" maxlength="10" required>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>

                <div class="row g-3 mt-2">
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email *</label>
                        <input type="email" class="form-control" id="email" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Gender *</label>
                        <div class="d-flex gap-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="Male">
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                        <div class="invalid-feedback d-block" id="genderError"></div>
                    </div>
                </div>

                <div class="row g-3 mt-2">
                    <div class="col-md-6">
                        <label for="address1" class="form-label">Address 1 *</label>
                        <textarea class="form-control" id="address1" rows="2" required></textarea>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="col-md-6">
                        <label for="address2" class="form-label">Address 2</label>
                        <textarea class="form-control" id="address2" rows="2"></textarea>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>

                <div class="mt-3 d-flex gap-2">
                    <button type="submit" id="submitBtn" class="btn btn-success">Add</button>
                    <button type="button" id="cancelBtn" class="btn btn-secondary">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="script.js"></script>
</body>
</html>
