<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role"); // e.g., "admin" or "user"
    String email = (String) session.getAttribute("email"); // You must store this during login
%>

<!DOCTYPE html>
<html>
<head>
    <title>Change Credentials</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h3 class="mb-4">Change Credentials</h3>
    
    <form  action="changeCredentialsServlet" method="post">
        <input type="hidden" name="role" value="<%= role %>">
        <input type="hidden" name="email" value="<%= email %>">
        
        <div class="mb-3">
    		<label>New Username</label>
    		<input type="text" name="newUsername" class="form-control" required>
		</div>
        
        <div class="mb-3">
            <label>Current Password</label>
            <input type="password" name="currentPassword" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>New Password</label>
            <input type="password" name="newPassword" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Confirm New Password</label>
            <input type="password" name="confirmPassword" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Change</button>
    </form>
</div>
</body>
</html>
