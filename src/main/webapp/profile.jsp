<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("Log.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .profile-container {
            width: 50%;
            margin: auto;
            padding: 20px;
        }
        .profile-container h1 {
            text-align: center;
        }
        .profile-details {
            margin-top: 20px;
        }
        .profile-details p {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h1>Welcome,</h1>
        <div class="profile-details">
            <p><strong>User ID:</strong> <%= user.getId() %></p>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <!-- Add more user details as needed -->
        </div>
        <p><a href="changeCredentials.jsp">Change Credentials</a></p>
        <p><a href="LogoutServlet">Logout</a></p>
    </div>
</body>
</html>
