<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee List</title>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
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
    width: 1100px;
    max-width: 100%;
    background: #fff;
    padding: 35px;
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
    margin-bottom: 25px;
    font-size: 2.2em;
}

/* FIX: New styles for improved alignment */
.top-actions {
    display: flex;
    flex-wrap: wrap; /* Allows wrapping on smaller screens */
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
    gap: 15px; /* Spacing between elements */
}

.search-container {
    flex-grow: 1; /* Allows search box to take remaining space */
    max-width: 400px; /* Limit the search box width */
}

.btn-add {
    background: linear-gradient(45deg, #4a90e2, #50b6ff);
    color: #fff;
    padding: 12px 25px;
    border-radius: 12px;
    font-weight: 600;
    text-decoration: none;
}

.btn-add:hover {
    box-shadow: 0 12px 25px rgba(74,144,226,0.3);
}

#searchBox {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: 1px solid #ccc;
    box-sizing: border-box; /* Crucial for flex layout */
}

table {
    width: 100%;
    border-collapse: collapse;
    font-size: 15px;
}

thead {
    background: linear-gradient(45deg, #4a90e2, #50b6ff);
    color: #fff;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    cursor: pointer; /* Indicate sortability */
}

tbody tr {
    border-bottom: 1px solid #eee;
}

tbody tr:hover {
    background: #f5f9ff;
}

.action-btn {
    padding: 7px 14px;
    font-size: 13px;
    border-radius: 8px;
    border: none;
    cursor: pointer;
    font-weight: 600;
    text-decoration: none;
    margin-right: 5px; /* Spacing between action buttons */
}

.btn-edit {
    background: #ffeaa7;
    color: #7a5c00;
}

.btn-delete {
    background: #fab1a0;
    color: #7a1c12;
}

.no-data {
    text-align: center;
    padding: 25px;
    color: #666;
}

/* Truncate long text with tooltip */
td[title] {
    cursor: pointer;
    max-width: 150px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

/* Responsive Styles */
@media (max-width: 900px) {
    .top-actions {
        flex-direction: column;
        align-items: stretch;
    }
    
    .search-container {
        max-width: 100%; /* Search takes full width on small screens */
        order: 3; /* Move search below the count and add button */
    }

    table, thead, tbody, th, td, tr {
        display: block;
    }
    thead {
        display: none;
    }
    tbody tr {
        margin-bottom: 15px;
        background: #f9f9f9;
        border-radius: 12px;
        padding: 15px;
    }
    td {
        display: flex;
        justify-content: space-between;
        padding: 6px 0;
    }
    td::before {
        content: attr(data-label);
        font-weight: 600;
    }
}
</style>
</head>

<body>

<div class="container">

    <h1>Employee List</h1>

    <div class="top-actions">
        <div class="search-container">
            <input type="text" id="searchBox" placeholder="Search by name..." onkeyup="searchEmployees()">
        </div>

        <div>
            <a href="employee-form" class="btn-add">+ Add Employee</a>
        </div>
        
    </div>
    <table>
        <thead>
            <tr id="tableHeader">
                <th onclick="sortTable('id')">ID <span class="sort-icon" data-field="id"></span></th>
                <th onclick="sortTable('name')">Name <span class="sort-icon" data-field="name"></span></th>
                <th onclick="sortTable('gender')">Gender <span class="sort-icon" data-field="gender"></span></th>
                <th onclick="sortTable('dob')">DOB <span class="sort-icon" data-field="dob"></span></th>
                <th onclick="sortTable('age')">Age <span class="sort-icon" data-field="age"></span></th>
                <th onclick="sortTable('mobile')">Mobile <span class="sort-icon" data-field="mobile"></span></th>
                <th onclick="sortTable('email')">Email <span class="sort-icon" data-field="email"></span></th>
                <th onclick="sortTable('address1')">Address1 <span class="sort-icon" data-field="address1"></span></th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody id="employeeTableBody">
            <tr><td colspan="9" class="no-data">Loading...</td></tr>
        </tbody>
    </table>

</div>
<div id="topCenterPopup" style="
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    background: #4caf50;
    color: #fff;
    padding: 15px 25px;
    border-radius: 8px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    display: none;
    z-index: 9999;
    font-weight: 600;
    text-align: center;
    font-size: 16px;
"></div>


<script>
var API_URL = "http://localhost:9090/api/v1/employees";
var employeeData = [];
var currentSortField = "id"; // Default sort field
var currentSortOrder = "asc"; // Default sort order (latest first)


/* Load all employees */
function loadEmployees() {
    axios.get(API_URL)
        .then(function(res) { 
            employeeData = res.data;
            // Initial sort by ID descending (to show latest first)
            sortTable(currentSortField, true); 
        })
        .catch(function() { showMessage("Failed to load employees"); });
}

/* Render table */
function renderTable(list) {
    var tbody = document.getElementById("employeeTableBody");
    tbody.innerHTML = "";

    if (!list || list.length === 0) {
        showMessage("No employees found");
        return;
    }

    for (var i = 0; i < list.length; i++) {
        var e = list[i];
        
        var serialNo;
        if (currentSortOrder === "desc") {
            serialNo = list.length - i;
        } else {
            serialNo = i + 1;
        }
        
        // Helper function to truncate text
        function truncateText(text, maxLength) {
            if (!text) return "";
            return text.length > maxLength ? text.substring(0, maxLength) + "..." : text;
        }

        var nameFull = e.firstName + " " + e.lastName;
        var nameDisplay = truncateText(nameFull, 20);

        var emailFull = e.email;
        var emailDisplay = truncateText(emailFull, 25);

        var addressFull = e.address1 ? e.address1 : "";
        var addressDisplay = truncateText(addressFull, 20);

        var mobileFull = e.mobile;
        var dobFull = e.dateOfBirth;
        var genderFull = e.gender;
        var ageFull = e.age;

        var row = "<tr>"
            + "<td data-label='ID'>" + serialNo + "</td>"
            + "<td data-label='Name' title='" + nameFull + "'>" + nameDisplay + "</td>"
            + "<td data-label='Gender' title='" + genderFull + "'>" + genderFull + "</td>"
            + "<td data-label='DOB' title='" + dobFull + "'>" + dobFull + "</td>"
            + "<td data-label='Age' title='" + ageFull + "'>" + ageFull + "</td>"
            + "<td data-label='Mobile' title='" + mobileFull + "'>" + mobileFull + "</td>"
            + "<td data-label='Email' title='" + emailFull + "'>" + emailDisplay + "</td>"
            + "<td data-label='Address1' title='" + addressFull + "'>" + addressDisplay + "</td>"
            + "<td data-label='Actions'>"
            + "<a href='employee-form?id=" + e.id + "' class='action-btn btn-edit'>Edit</a>"
            + "<button class='action-btn btn-delete' onclick='deleteEmployee(" + e.id + ")'>Delete</button>"
            + "</td>"
            + "</tr>";

        tbody.innerHTML += row;
    }
}

/* FIX: Updated sortTable to handle current sort state and update icons */
function sortTable(field, forceSort = false) {
    // If not forcing a sort and clicking the same field, flip the order
    if (currentSortField === field && !forceSort) {
        currentSortOrder = currentSortOrder === "asc" ? "desc" : "asc";
    } else if (currentSortField !== field) {
        currentSortField = field;
        currentSortOrder = "asc"; // Default to ascending when changing fields
    }

    employeeData.sort(function(a, b) {
        var multiplier = currentSortOrder === "asc" ? 1 : -1;
        var valA, valB;

        switch (field) {

            case "id":   // ✅ FIX
                valA = a.id;
                valB = b.id;
                return (valA - valB) * multiplier;

            case "name":
                valA = (a.firstName + " " + a.lastName).toLowerCase();
                valB = (b.firstName + " " + b.lastName).toLowerCase();
                break;

            case "dob":
                valA = new Date(a.dateOfBirth);
                valB = new Date(b.dateOfBirth);
                return (valA - valB) * multiplier;

            case "age":
                valA = a.age;
                valB = b.age;
                return (valA - valB) * multiplier;

            default:
                valA = (a[field] || "").toString().toLowerCase();
                valB = (b[field] || "").toString().toLowerCase();
        }

        if (valA < valB) return -1 * multiplier;
        if (valA > valB) return 1 * multiplier;
        return 0;
    });

    // Update icons in the header
    document.querySelectorAll('.sort-icon').forEach(icon => {
        icon.innerHTML = "";
    });

    var activeIcon = document.querySelector('.sort-icon[data-field="' + currentSortField + '"]');
    if (activeIcon) {
        activeIcon.innerHTML = currentSortOrder === "asc" ? " ▲" : " ▼";
    }
    renderTable(employeeData);
}
/* END FIX */


/* Delete with SweetAlert2 */
function deleteEmployee(id) {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then(function(result) {
        if (result.isConfirmed) {
            axios.delete(API_URL + "/" + id)
                .then(function(res) {
                    Swal.fire('Deleted!', 'Employee has been deleted.', 'success');
                    loadEmployees();
                })
                .catch(function(err) {
                    console.error("Delete failed:", err);
                    Swal.fire('Error!', 'Delete failed. Please try again.', 'error');
                });
        }
    });
}

/* Search employees */
function searchEmployees() {
    var name = document.getElementById("searchBox").value.trim();
    
    // Check if the current list already contains search results and if search is empty
    if (name === "" && employeeData.length > 0) { 
        loadEmployees(); 
        return; 
    }
    
    // Only search if the name is not empty
    if (name !== "") {
        axios.get(API_URL + "/search", { params: { name: name } })
            .then(function(res) {     
                employeeData = res.data;
                // Render search results, maintaining the current sort order
                sortTable(currentSortField, true); 
            })
            .catch(function(err) { Swal.fire('Error', 'Search failed', 'error'); });
    }
}

/* Message */
function showMessage(msg) {
    document.getElementById("employeeTableBody").innerHTML =
        "<tr><td colspan='9' class='no-data'>" + msg + "</td></tr>";
}

/* Initial load and Success Message Popup */
document.addEventListener("DOMContentLoaded", function() {
    loadEmployees();
    
    const msg = sessionStorage.getItem('successMessage');
    if(msg) {
        const popup = document.getElementById('topCenterPopup');
        popup.innerText = msg;
        popup.style.display = 'block';
        popup.style.background = (msg.includes('Deleted') || msg.includes('Failed')) ? '#d33' : '#4caf50';

        // Automatically hide after 3 seconds
        setTimeout(() => {
            popup.style.display = 'none';
            sessionStorage.removeItem('successMessage');
        }, 3000);
    }
});
</script>

</body>
</html>

 --%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee List</title>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body { 
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
    width: 1250px; 
    max-width: 100%; 
    background: #fff; 
    padding: 35px; 
    border-radius: 20px; 
    box-shadow: 0 25px 50px rgba(0,0,0,0.15); 
    animation: fadeIn 0.5s ease-out;
    box-sizing: border-box;
}

@keyframes fadeIn { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }

h1 { text-align: center; margin-bottom: 25px; font-size: 2.2em; }

.top-actions { display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; margin-bottom: 15px; gap: 15px; }
.search-container { flex-grow: 1; max-width: 400px; }

.btn-add { background: linear-gradient(45deg, #4a90e2, #50b6ff); color: #fff; padding: 12px 25px; border-radius: 12px; font-weight: 600; text-decoration: none; }
.btn-add:hover { box-shadow: 0 12px 25px rgba(74,144,226,0.3); }

#searchBox { width: 100%; padding: 12px; border-radius: 10px; border: 1px solid #ccc; box-sizing: border-box; }

/* TABLE FIXES FOR CONTAINER OVERFLOW */
.table-responsive {
    width: 100%;
    overflow-x: auto; /* Adds scrollbar if screen is too small */
    border-radius: 10px;
}

table { 
    width: 100%; 
    border-collapse: collapse; 
    font-size: 14px; 
    table-layout: fixed; /* Locks column widths */
}

thead { background: linear-gradient(45deg, #4a90e2, #50b6ff); color: #fff; }
th, td { padding: 12px 8px; text-align: left; overflow: hidden; }
th { cursor: pointer; white-space: nowrap; }

/* FIXED COLUMN WIDTHS (Total ~1030px to fit inside 1100px container) */
th:nth-child(1), td:nth-child(1) { width: 50px; }  /* ID */
th:nth-child(2), td:nth-child(2) { width: 140px; } /* Name */
th:nth-child(3), td:nth-child(3) { width: 80px; }  /* Gender */
th:nth-child(4), td:nth-child(4) { width: 100px; } /* DOB */
th:nth-child(5), td:nth-child(5) { width: 60px; }  /* Age */
th:nth-child(6), td:nth-child(6) { width: 110px; } /* Mobile */
th:nth-child(7), td:nth-child(7) { width: 160px; } /* Email */
th:nth-child(8), td:nth-child(8) { width: 180px; } /* Address */
th:nth-child(9), td:nth-child(9) { width: 150px; } /* Actions */

tbody tr { border-bottom: 1px solid #eee; }
tbody tr:hover { background: #f5f9ff; }

/* TOOLTIP & TRUNCATION */
td[title] { 
    cursor: help; 
    text-overflow: ellipsis; 
    white-space: nowrap; 
}

.action-btn { padding: 6px 10px; font-size: 12px; border-radius: 6px; border: none; cursor: pointer; font-weight: 600; text-decoration: none; margin-right: 2px; display: inline-block; }
.btn-edit { background: #ffeaa7; color: #7a5c00; }
.btn-delete { background: #fab1a0; color: #7a1c12; }

.no-data { text-align: center; padding: 25px; color: #666; }

/* PAGINATION STYLES */
.pagination-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 25px;
    padding-top: 15px;
    border-top: 1px solid #eee;
}
.pagination-info { color: #666; font-weight: 500; }
.pagination-buttons { display: flex; gap: 5px; align-items: center; }
.page-link { 
    padding: 8px 14px; 
    border: 1px solid #dee2e6; 
    background: #fff; 
    color: #4a90e2; 
    cursor: pointer; 
    border-radius: 8px; 
    font-weight: 600; 
    min-width: 40px; 
    text-align: center;
    border: none;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}
.page-link:hover:not(.disabled) { background: #e9ecef; }
.page-link.active { background: #4a90e2; color: white; }
.page-link.disabled { color: #ccc; cursor: not-allowed; background: #f8f9fa; }
.dots { color: #999; padding: 0 5px; }

@media (max-width: 900px) {
    .top-actions { flex-direction: column; align-items: stretch; }
    .search-container { max-width: 100%; order: 3; }
    table { table-layout: auto; } 
    table, thead, tbody, th, td, tr { display: block; }
    thead { display: none; }
    tbody tr { margin-bottom: 15px; background: #f9f9f9; border-radius: 12px; padding: 15px; }
    td { display: flex; justify-content: space-between; padding: 8px 0; width: 100% !important; box-sizing: border-box;}
    td::before { content: attr(data-label); font-weight: 600; }
    .pagination-wrapper { flex-direction: column; gap: 15px; text-align: center; }
}
</style>
</head>

<body>

<div class="container">
    <h1>Employee List</h1>

    <div class="top-actions">
        <div class="search-container">
            <input type="text" id="searchBox" placeholder="Search by name..." oninput="this.value = this.value.replace(/[^a-zA-Z\s]/g, '')" onkeyup="searchEmployees()">
        </div>
        <div>
            <a href="employee-form" class="btn-add">+ Add Employee</a>
        </div>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
                <tr id="tableHeader">
                    <th onclick="sortTable('id')">ID <span class="sort-icon" data-field="id"></span></th>
                    <th onclick="sortTable('name')">Name <span class="sort-icon" data-field="name"></span></th>
                    <th onclick="sortTable('gender')">Gender <span class="sort-icon" data-field="gender"></span></th>
                    <th onclick="sortTable('dob')">DOB <span class="sort-icon" data-field="dob"></span></th>
                    <th onclick="sortTable('age')">Age <span class="sort-icon" data-field="age"></span></th>
                    <th onclick="sortTable('mobile')">Mobile <span class="sort-icon" data-field="mobile"></span></th>
                    <th onclick="sortTable('email')">Email <span class="sort-icon" data-field="email"></span></th>
                    <th onclick="sortTable('address1')">Address1 <span class="sort-icon" data-field="address1"></span></th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="employeeTableBody">
                <tr><td colspan="9" class="no-data">Loading...</td></tr>
            </tbody>
        </table>
    </div>

    <div class="pagination-wrapper">
        <div id="paginationInfo" class="pagination-info"></div>
        <div id="paginationButtons" class="pagination-buttons"></div>
    </div>
</div>

<div id="topCenterPopup" style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); background: #4caf50; color: #fff; padding: 15px 25px; border-radius: 8px; box-shadow: 0 5px 15px rgba(0,0,0,0.3); display: none; z-index: 9999; font-weight: 600; text-align: center; font-size: 16px;"></div>

<script>
var API_URL = "http://localhost:9090/api/v1/employees";
var employeeData = [];
var currentSortField = "id";
var currentSortOrder = "asc";
var currentPage = 1;
var rowsPerPage = 10;

function loadEmployees() {
    axios.get(API_URL)
        .then(function(res) { 
            employeeData = res.data;
            sortTable(currentSortField, true); 
        })
        .catch(function() { showMessage("Failed to load employees"); });
}

function renderTable(list) {
    var tbody = document.getElementById("employeeTableBody");
    tbody.innerHTML = "";

    if (!list || list.length === 0) {
        showMessage("No employees found");
        document.getElementById("paginationInfo").innerText = "";
        document.getElementById("paginationButtons").innerHTML = "";
        return;
    }

    var start = (currentPage - 1) * rowsPerPage;
    var end = start + rowsPerPage;
    var paginatedItems = list.slice(start, end);
    var totalPages = Math.ceil(list.length / rowsPerPage);

    var displayEnd = end > list.length ? list.length : end;
    document.getElementById("paginationInfo").innerText = (start + 1) + " - " + displayEnd + " of " + list.length;

    for (var i = 0; i < paginatedItems.length; i++) {
        var e = paginatedItems[i];
        var serialNo = (currentSortOrder === "desc") ? (list.length - (start + i)) : (start + i + 1);
        
        var fullName = e.firstName + " " + e.lastName;

        var row = "<tr>"
            + "<td data-label='ID'>" + serialNo + "</td>"
            + "<td data-label='Name' title='" + fullName + "'>" + fullName + "</td>"
            + "<td data-label='Gender' title='" + e.gender + "'>" + e.gender + "</td>"
            + "<td data-label='DOB' title='" + e.dateOfBirth + "'>" + e.dateOfBirth + "</td>"
            + "<td data-label='Age' title='" + e.age + "'>" + e.age + "</td>"
            + "<td data-label='Mobile' title='" + e.mobile + "'>" + e.mobile + "</td>"
            + "<td data-label='Email' title='" + e.email + "'>" + e.email + "</td>"
            + "<td data-label='Address1' title='" + (e.address1 || "") + "'>" + (e.address1 || "") + "</td>"
            + "<td data-label='Actions'>"
            + "<a href='employee-form?id=" + e.id + "' class='action-btn btn-edit'>Edit</a>"
            + "<button class='action-btn btn-delete' onclick='deleteEmployee(" + e.id + ")'>Delete</button>"
            + "</td>"
            + "</tr>";
        tbody.innerHTML += row;
    }
    setupPagination(totalPages);
}

function setupPagination(totalPages) {
    var btnContainer = document.getElementById("paginationButtons");
    btnContainer.innerHTML = "";
    if (totalPages <= 1) return;

    btnContainer.innerHTML += '<button class="page-link ' + (currentPage === 1 ? 'disabled' : '') + '" onclick="changePage(' + (currentPage - 1) + ')">Prev</button>';

    var range = 2; 
    for (var i = 1; i <= totalPages; i++) {
        if (i === 1 || i === totalPages || (i >= currentPage - range && i <= currentPage + range)) {
            btnContainer.innerHTML += '<button class="page-link ' + (currentPage === i ? 'active' : '') + '" onclick="changePage(' + i + ')">' + i + '</button>';
        } else if (i === currentPage - range - 1 || i === currentPage + range + 1) {
            btnContainer.innerHTML += '<span class="dots">...</span>';
        }
    }

    btnContainer.innerHTML += '<button class="page-link ' + (currentPage === totalPages ? 'disabled' : '') + '" onclick="changePage(' + (currentPage + 1) + ')">Next</button>';
}

function changePage(page) {
    var totalPages = Math.ceil(employeeData.length / rowsPerPage);
    if (page < 1 || page > totalPages) return;
    currentPage = page;
    renderTable(employeeData);
}

function sortTable(field, forceSort = false) {
    if (currentSortField === field && !forceSort) {
        currentSortOrder = currentSortOrder === "asc" ? "desc" : "asc";
    } else {
        if(!forceSort) currentSortField = field;
        if(!forceSort) currentSortOrder = "asc";
    }

    employeeData.sort(function(a, b) {
        var multiplier = currentSortOrder === "asc" ? 1 : -1;
        var valA, valB;
        switch (field) {
            case "id": valA = a.id; valB = b.id; return (valA - valB) * multiplier;
            case "name": valA = (a.firstName + " " + a.lastName).toLowerCase(); valB = (b.firstName + " " + b.lastName).toLowerCase(); break;
            case "dob": valA = new Date(a.dateOfBirth); valB = new Date(b.dateOfBirth); return (valA - valB) * multiplier;
            case "age": valA = a.age; valB = b.age; return (valA - valB) * multiplier;
            default: valA = (a[field] || "").toString().toLowerCase(); valB = (b[field] || "").toString().toLowerCase();
        }
        if (valA < valB) return -1 * multiplier;
        if (valA > valB) return 1 * multiplier;
        return 0;
    });

    document.querySelectorAll('.sort-icon').forEach(icon => icon.innerHTML = "");
    var activeIcon = document.querySelector('.sort-icon[data-field="' + currentSortField + '"]');
    if (activeIcon) activeIcon.innerHTML = currentSortOrder === "asc" ? " ▲" : " ▼";
    
    currentPage = 1; 
    renderTable(employeeData);
}

function deleteEmployee(id) {
    Swal.fire({
        title: 'Are you sure?', text: "You won't be able to revert this!", icon: 'warning',
        showCancelButton: true, confirmButtonColor: '#3085d6', cancelButtonColor: '#d33', confirmButtonText: 'Yes, delete it!'
    }).then(function(result) {
        if (result.isConfirmed) {
            axios.delete(API_URL + "/" + id).then(function(res) {
                Swal.fire('Deleted!', 'Employee has been deleted.', 'success');
                loadEmployees();
            }).catch(function(err) {
                Swal.fire('Error!', 'Delete failed.', 'error');
            });
        }
    });
}

function searchEmployees() {
    var name = document.getElementById("searchBox").value.trim();
    if (name === "" && employeeData.length > 0) { loadEmployees(); return; }
    if (name !== "") {
        axios.get(API_URL + "/search", { params: { name: name } })
            .then(function(res) { 
                employeeData = res.data;
                currentPage = 1; 
                sortTable(currentSortField, true); 
            }).catch(function(err) { Swal.fire('Error', 'Search failed', 'error'); });
    }
}

function showMessage(msg) {
    document.getElementById("employeeTableBody").innerHTML = "<tr><td colspan='9' class='no-data'>" + msg + "</td></tr>";
}

document.addEventListener("DOMContentLoaded", function() {
    loadEmployees();
    const msg = sessionStorage.getItem('successMessage');
    if(msg) {
        const popup = document.getElementById('topCenterPopup');
        popup.innerText = msg;
        popup.style.display = 'block';
        popup.style.background = (msg.includes('Deleted') || msg.includes('Failed')) ? '#d33' : '#4caf50';
        setTimeout(() => { popup.style.display = 'none'; sessionStorage.removeItem('successMessage'); }, 3000);
    }
});
</script>
</body>
</html>
  