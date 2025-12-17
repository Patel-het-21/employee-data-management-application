<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
 --%>
 
<%--  
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>

<style>
    body {
        /* Vibrant background gradient */
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #a1c4fd, #c2e9fb); 
        min-height: 100vh;
        margin: 0;
        padding: 40px 15px;
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }

    .container {
        /* Wider container for two columns */
        width: 850px; 
        max-width: 100%;
        background: #ffffff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 25px 50px rgba(0,0,0,0.15);
        animation: fadeIn 0.5s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h1 {
        text-align: center;
        margin-bottom: 40px;
        color: #1a1a1a;
        font-weight: 700;
        font-size: 2.2em;
    }

    /* --- TWO COLUMN LAYOUT --- */
    .row {
        display: flex; 
        gap: 30px;
        margin-bottom: 25px;
    }
    
    /* Make Address 1 & 2 full width for better readability */
    .row.full-width .form-group {
        flex: 100%;
    }

    .form-group {
        flex: 1; 
    }

    label {
        font-weight: 600;
        margin-bottom: 8px;
        display: block;
        color: #333;
        font-size: 15px;
    }
    
    /* Style for the required asterisk */
    .required-asterisk {
        color: #f64e60; /* Error red */
        margin-left: 4px;
    }

    input:not([type="radio"]), textarea { 
        width: 100%;
        padding: 14px;
        border-radius: 10px;
        border: 1px solid #ddd;
        font-size: 15px;
        transition: all 0.3s;
        box-sizing: border-box;
    }

    input:not([type="radio"]):focus, textarea:focus {
        border-color: #4a90e2; 
        box-shadow: 0 0 0 4px rgba(74, 144, 226, 0.2);
        outline: none;
    }
    
    textarea {
        resize: vertical;
        min-height: 80px;
    }

    /* 🔴 ERROR STYLE */
    .input-error {
        border-color: #f64e60 !important; 
        box-shadow: 0 0 0 4px rgba(246, 78, 96, 0.15);
        animation: shake 0.3s;
    }

    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        20%, 60% { transform: translateX(-5px); }
        40%, 80% { transform: translateX(5px); }
    }

    .error {
        color: #f64e60;
        font-size: 12px;
        min-height: 18px; 
        margin-top: 6px;
    }

    .gender-group {
        display: flex;
        gap: 35px;
        margin-top: 10px;
        align-items: center;
    }
    
    .gender-group label {
        display: flex;
        align-items: center;
        gap: 8px;
        font-weight: 400;
        color: #555;
    }

    .center {
        text-align: center;
        margin-top: 40px;
    }
    
    .button-group {
        display: flex;
        justify-content: center;
        gap: 20px; 
        margin-bottom: 20px;
    }

    .btn {
        padding: 15px 45px;
        font-size: 16px;
        font-weight: 600;
        border-radius: 12px;
        border: none;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 0.8px;
    }
    
    /* Submit Button Styling */
    .btn-submit {
        background: linear-gradient(45deg, #4a90e2, #50b6ff);
        color: #fff;
        cursor: not-allowed;
        opacity: 0.6;
    }

    .btn-submit.enabled {
        cursor: pointer;
        opacity: 1;
    }

    .btn-submit.enabled:hover {
        transform: translateY(-4px); 
        box-shadow: 0 15px 30px rgba(74, 144, 226, 0.3);
    }
    
    /* Clear Button Styling */
    .btn-clear {
        background: #f0f0f0;
        color: #666;
        border: 2px solid #ddd;
        cursor: pointer;
    }

    .btn-clear:hover {
        background: #e0e0e0;
        color: #333;
        transform: translateY(-2px); 
        box-shadow: 0 8px 15px rgba(0,0,0,0.1);
    }
    
    /* View All Link Styling */
    .view-all-link {
        display: block;
        margin-top: 15px;
        color: #4a90e2;
        text-decoration: none;
        font-size: 14px;
        font-weight: 600;
    }

    .view-all-link:hover {
        text-decoration: underline;
    }
    
    /* --- Mobile Responsiveness for Two Columns --- */
    @media (max-width: 900px) {
        .container {
            padding: 30px 20px;
        }

        .row {
            flex-direction: column; 
            gap: 15px; 
            margin-bottom: 15px;
        }
        
        .button-group {
            flex-direction: column;
            gap: 10px;
        }
    }
</style>

<script>
    const MAX_NAME_LENGTH = 50;
    const MOBILE_LENGTH = 10;
    const MIN_ADDR_LENGTH = 4;
    const MAX_ADDR_LENGTH = 255;
    const MAX_EMAIL_LENGTH = 254; // New standard max length constant

    const validity = {
        firstName: false,
        lastName: false,
        dob: false,
        mobile: false,
        email: false,
        address1: false, 
        address2: true,  
        gender: false
    };

    const formInputs = ['firstName', 'lastName', 'dob', 'mobile', 'email', 'address1', 'address2'];

    function updateSubmitButton() {
        const allValid = Object.values(validity).every(v => v);
        const btn = document.getElementById("submitBtn");
        btn.disabled = !allValid;
        btn.classList.toggle("enabled", allValid);
    }

    function setError(id, errorId, msg) {
        document.getElementById(id).classList.add("input-error");
        document.getElementById(errorId).innerText = msg;
        validity[id] = false;
        updateSubmitButton();
    }

    function clearError(id, errorId) {
        document.getElementById(id).classList.remove("input-error");
        document.getElementById(errorId).innerText = "";
        validity[id] = true;
        updateSubmitButton();
    }

    function validateRequired(input, errorId, fieldName, isMandatory = true) {
        const trimmedValue = input.value.trim();
        const id = input.id;

        // 1. Check for emptiness 
        if (trimmedValue.length === 0 || (id === 'dob' && !trimmedValue)) {
            if (isMandatory) {
                setError(id, errorId, fieldName + " is required?"); 
            } else {
                clearError(id, errorId); 
                validity[id] = true; 
                updateSubmitButton();
            }
            return;
        }

        // 2. If not empty, run the full validation logic
        if (id === 'firstName' || id === 'lastName') {
            validateName(input, errorId);
        } else if (id === 'dob') {
            calculateAge(); 
        } else if (id === 'mobile') {
            validateMobile();
        } else if (id === 'email') {
            validateEmail();
        } else if (id === 'address1') {
            validateAddress(input, errorId, true);
        } else if (id === 'address2') {
            validateAddress(input, errorId, false);
        }
    }
    
    /**
     * FIX 2: Updated Address validation to show MAX length reached message.
     */
    function validateAddress(input, errorId, isMandatory) {
        const value = input.value;
        const trimmedValue = value.trim();
        const id = input.id;

        // 1. Handle empty case for ONINPUT.
        if (trimmedValue.length === 0) {
            clearError(id, errorId);
            validity[id] = !isMandatory;
            updateSubmitButton();
            return;
        }

        // 2. Check maximum length reached (Real-time feedback)
        if (value.length === MAX_ADDR_LENGTH) {
            document.getElementById(id).classList.remove("input-error");
            document.getElementById(errorId).innerText = `Maximum limit of ${MAX_ADDR_LENGTH} characters reached.`;
            validity[id] = true;
            updateSubmitButton();
            return;
        }
        
        // 3. Check minimum length
        if (trimmedValue.length < MIN_ADDR_LENGTH) {
            setError(id, errorId, `Minimum ${MIN_ADDR_LENGTH} characters required.`);
            return;
        }
        
        // 4. If all checks pass and length < MAX
        clearError(id, errorId);
    }
    
    function validateName(input, errorId) {
        const value = input.value; 
        const trimmedValue = input.value.trim();
        const id = input.id;
        
        if (trimmedValue.length === 0) {
            clearError(id, errorId); 
            validity[id] = false;
            updateSubmitButton();
            return;
        }
        
        if (!/^[A-Za-z\s]+$/.test(value)) {
            setError(id, errorId, "Only letters and spaces are allowed.");
            return;
        }
        
        if (trimmedValue.length < 2) {
            setError(id, errorId, "Minimum 2 characters required.");
            return;
        }
        
        if (value.length === MAX_NAME_LENGTH) {
            document.getElementById(id).classList.remove("input-error");
            document.getElementById(errorId).innerText = `Maximum length of ${MAX_NAME_LENGTH} characters reached.`;
            validity[id] = true; 
            updateSubmitButton();
            return; 
        }
        
        clearError(id, errorId);
    }

    function calculateAge() {
        const dobInput = document.getElementById("dob");
        const dob = dobInput.value;
        
        if (!dob) {
            document.getElementById("age").value = "";
            clearError("dob", "dobError"); 
            validity.dob = false;
            updateSubmitButton();
            return;
        }

        const birth = new Date(dob);
        const today = new Date();
        let age = today.getFullYear() - birth.getFullYear();

        if (
            today.getMonth() < birth.getMonth() ||
            (today.getMonth() === birth.getMonth() && today.getDate() < birth.getDate())
        ) age--;

        if (age < 18 || age > 110) {
            setError("dob", "dobError", "Age must be between 18 and 110.");
            document.getElementById("age").value = "";
        } else {
            clearError("dob", "dobError");
            document.getElementById("age").value = age;
        }
    }

    function validateMobile() {
        const mobileInput = document.getElementById("mobile");
        const mobile = mobileInput.value;
        
        if (mobile.length === 0) {
             clearError("mobile", "mobileError");
             validity.mobile = false;
             updateSubmitButton();
             return;
        }
        
        if (mobile.startsWith('0')) {
            setError("mobile", "mobileError", "Mobile number cannot start with 0.");
            return;
        }
        
        if (mobile.length < MOBILE_LENGTH) {
            setError("mobile", "mobileError", `Must be exactly ${MOBILE_LENGTH} digits. (${mobile.length}/${MOBILE_LENGTH})`);
            return;
        }

        if (mobile.length > MOBILE_LENGTH) {
            setError("mobile", "mobileError", `Maximum ${MOBILE_LENGTH} digits allowed.`);
            return;
        }
        
        if (!/^[1-9]\d{9}$/.test(mobile)) {
             setError("mobile", "mobileError", "Invalid mobile number format.");
             return;
        }
        
        clearError("mobile", "mobileError");
    }

    /**
     * FIX 1: Updated Email validation to show MAX length reached message.
     */
    function validateEmail() {
        const email = document.getElementById("email").value;

        if (email.length === 0) {
             clearError("email", "emailError");
             validity.email = false;
             updateSubmitButton();
             return;
        }
        
        // 1. Check for max length reached (Real-time feedback)
        if (email.length === MAX_EMAIL_LENGTH) {
            document.getElementById("email").classList.remove("input-error");
            document.getElementById("emailError").innerText = `Maximum standard length of ${MAX_EMAIL_LENGTH} characters reached.`;
            validity.email = true; 
            updateSubmitButton();
            return;
        }

        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            setError("email", "emailError", "Please enter a valid email address");
            return;
        }
        
        clearError("email", "emailError");
    }

    function setGender() {
        validity.gender = true;
        updateSubmitButton();
    }

    function clearForm() {
        document.getElementById('employeeForm').reset();
        
        formInputs.forEach(id => {
            document.getElementById(id).classList.remove("input-error");
        });
        document.getElementById('age').value = '';

        document.getElementById('fnError').innerText = '';
        document.getElementById('lnError').innerText = '';
        document.getElementById('dobError').innerText = '';
        document.getElementById('mobileError').innerText = '';
        document.getElementById('emailError').innerText = '';
        document.getElementById('addr1Error').innerText = '';
        document.getElementById('addr2Error').innerText = '';
        document.getElementById('genderError').innerText = '';
        
        Object.keys(validity).forEach(key => validity[key] = false);
        validity.address2 = true; 

        updateSubmitButton();
    }
    
    document.addEventListener('DOMContentLoaded', function() {
        const mobileInput = document.getElementById('mobile');
        
        mobileInput.addEventListener('keypress', function(event) {
            if (event.key < '0' || event.key > '9') {
                if (event.keyCode > 31 && (event.keyCode < 48 || event.keyCode > 57)) {
                    event.preventDefault(); 
                }
            }
        });

        mobileInput.addEventListener('input', function() {
            let value = this.value;
            const cleanValue = value.replace(/\D/g, ''); 
            
            if (value !== cleanValue) {
                this.value = cleanValue;
            }
            
            validateMobile();
        });
        
    });

</script>
</head>

<body>

<div class="container">
    <h1>Employee Registration</h1>

    <form method="post" action="/employees/save" id="employeeForm">

        <div class="row">
            <div class="form-group">
                <label for="firstName">First Name<span class="required-asterisk">*</span></label>
                <input id="firstName" name="firstName" maxlength="50"
                       oninput="validateName(this,'fnError')"
                       onblur="validateRequired(this,'fnError', 'First Name')" required>
                <div class="error" id="fnError"></div>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name<span class="required-asterisk">*</span></label>
                <input id="lastName" name="lastName" maxlength="50"
                       oninput="validateName(this,'lnError')"
                       onblur="validateRequired(this,'lnError', 'Last Name')" required>
                <div class="error" id="lnError"></div>
            </div>
        </div>

        <div class="row">
            <div class="form-group">
                <label for="dob">Date of Birth<span class="required-asterisk">*</span></label>
                <input type="date" id="dob" name="dob" 
                       max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"
                       oninput="calculateAge()"
                       onblur="validateRequired(this,'dobError', 'Date of Birth')" required>
                <div class="error" id="dobError"></div>
            </div>

            <div class="form-group">
                <label for="age">Calculated Age</label>
                <input id="age" name="age" disabled placeholder="Age will show here">
            </div>
        </div>

        <div class="row">
            <div class="form-group">
                <label for="mobile">Mobile Number<span class="required-asterisk">*</span></label>
                <input type="tel" id="mobile" name="mobile" maxlength="10" pattern="\d*" 
                       oninput="validateMobile()" 
                       onblur="validateRequired(this,'mobileError', 'Mobile Number')" required>
                <div class="error" id="mobileError"></div>
            </div>

            <div class="form-group">
                <label for="email">Email Address<span class="required-asterisk">*</span></label>
                <input type="email" id="email" name="email"
                       oninput="validateEmail()"
                       onblur="validateRequired(this,'emailError', 'Email Address')" 
                       maxlength="254" required>
                <div class="error" id="emailError"></div>
            </div>
        </div>
        
        <div class="row full-width">
            <div class="form-group">
                <label for="address1">Address Line 1<span class="required-asterisk">*</span></label>
                <textarea id="address1" name="address1" maxlength="255"
                          oninput="validateAddress(this, 'addr1Error', true)"
                          onblur="validateRequired(this, 'addr1Error', 'Address Line 1', true)" required></textarea>
                <div class="error" id="addr1Error"></div>
            </div>
        </div>
        
        <div class="row full-width">
            <div class="form-group">
                <label for="address2">Address Line 2</label>
                <textarea id="address2" name="address2" maxlength="255"
                          oninput="validateAddress(this, 'addr2Error', false)"
                          onblur="validateRequired(this, 'addr2Error', 'Address Line 2', false)"></textarea>
                <div class="error" id="addr2Error"></div>
            </div>
        </div>


        <div class="row">
            <div class="form-group">
                <label>Gender<span class="required-asterisk">*</span></label>
                <div class="gender-group">
                    <label for="genderMale"><input type="radio" id="genderMale" name="gender" value="Male" onclick="setGender()"> Male</label>
                    <label for="genderFemale"><input type="radio" id="genderFemale" name="gender" value="Female" onclick="setGender()"> Female</label>
                    <label for="genderOther"><input type="radio" id="genderOther" name="gender" value="Other" onclick="setGender()"> Other</label>
                </div>
                <div class="error" id="genderError"></div>
            </div>
        </div>

        <div class="center">
            <div class="button-group">
                <button type="button" class="btn btn-clear" onclick="clearForm()">Clear Form</button>
                
                <button id="submitBtn" class="btn btn-submit" disabled>Register Employee</button>
            </div>
            
            <a href="employee-list" class="view-all-link">View All Employees</a>
        </div>

    </form>
</div>

</body>
</html> --%>












<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Employee Registration</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/employee-form.css">
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/employee-form.js" defer></script>
</head>
<body>
<div class="container">
    <h1 id="formHeading">Employee Registration</h1>
    <form id="employeeForm">
        <div class="row">
            <div class="form-group">
                <label for="firstName">First Name<span class="required-asterisk">*</span></label>
                <input id="firstName" name="firstName" maxlength="50" oninput="validateName(this,'fnError'); validateRequired(this,'fnError','First Name')" onblur="validateRequired(this,'fnError','First Name')" required>
                <div class="error" id="fnError"></div>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name<span class="required-asterisk">*</span></label>
                <input id="lastName" name="lastName" maxlength="50" oninput="validateName(this,'lnError'); validateRequired(this,'lnError','Last Name')" onblur="validateRequired(this,'lnError','Last Name')" required>
                <div class="error" id="lnError"></div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="dob">Date of Birth<span class="required-asterisk">*</span></label>
                <input type="date" id="dob" name="dob" max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" oninput="calculateAge()" onblur="validateRequired(this,'dobError','Date of Birth')" required>
                <div class="error" id="dobError"></div>
            </div>
            <div class="form-group">
                <label for="age">Calculated Age</label>
                <input id="age" name="age" disabled placeholder="Age will show here">
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="mobile">Mobile Number<span class="required-asterisk">*</span></label>
                <input type="tel" id="mobile" name="mobile" maxlength="10" pattern="\d*" oninput="validateMobile(); validateRequired(this,'mobileError','Mobile Number')" onblur="validateRequired(this,'mobileError','Mobile Number'); checkMobileDuplicate()" required>
                <div class="error" id="mobileError"></div>
            </div>
            <div class="form-group">
                <label for="email">Email Address<span class="required-asterisk">*</span></label>
                <input type="email" id="email" name="email" oninput="validateEmail(); validateRequired(this,'emailError','Email Address')" onblur="validateRequired(this,'emailError','Email Address'); checkEmailDuplicate()" maxlength="254" required>
                <div class="error" id="emailError"></div>
            </div>
        </div>
        <div class="row full-width">
            <div class="form-group">
                <label for="address1">Address Line 1<span class="required-asterisk">*</span></label>
                <textarea id="address1" name="address1" maxlength="255" oninput="validateAddress(this,'addr1Error',true); validateRequired(this,'addr1Error','Address Line 1',true)" onblur="validateRequired(this,'addr1Error','Address Line 1',true)" required></textarea>
                <div class="error" id="addr1Error"></div>
            </div>
        </div>
        <div class="row full-width">
            <div class="form-group">
                <label for="address2">Address Line 2</label>
                <textarea id="address2" name="address2" maxlength="255" oninput="validateAddress(this,'addr2Error',false)" onblur="validateRequired(this,'addr2Error','Address Line 2',false)"></textarea>
                <div class="error" id="addr2Error"></div>
            </div>	
        </div>
        <div class="row">
            <div class="form-group">
                <label>Gender<span class="required-asterisk">*</span></label>
                <div class="gender-group">
                    <label for="genderMale"><input type="radio" id="genderMale" name="gender" value="Male" onclick="setGender()"> Male</label>
                    <label for="genderFemale"><input type="radio" id="genderFemale" name="gender" value="Female" onclick="setGender()"> Female</label>
                    <label for="genderOther"><input type="radio" id="genderOther" name="gender" value="Other" onclick="setGender()"> Other</label>
                </div>
                <div class="error" id="genderError"></div>
            </div>
        </div>
        <div class="center">
            <div class="button-group" id="formButtons"></div>
            <a href="employee-list" class="view-all-link">View All Employees</a>
        </div>
    </form>
</div>
</body>
</html>