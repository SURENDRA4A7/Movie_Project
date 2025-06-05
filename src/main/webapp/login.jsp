<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Movie Booking App</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('Images/bookmyshow.jpg'); /* Place your image in /webapp/images/ */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background-color: rgba(0, 0, 0, 0.75);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
            width: 320px;
            color: #fff;
            text-align: center;
        }

        .login-box h2 {
            margin-bottom: 24px;
            font-weight: bold;
            color: #ffc107;
        }

        .login-box label {
            display: block;
            text-align: left;
            margin: 10px 0 4px;
            font-weight: bold;
        }

        .login-box input[type="email"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: none;
            border-radius: 8px;
            background-color: #eee;
        }

        .login-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(45deg, #0d6efd, #6610f2);
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .login-box input[type="submit"]:hover {
            background: linear-gradient(45deg, #0056b3, #520dc2);
        }

        .login-box a {
            color: #ffc107;
            text-decoration: none;
            display: inline-block;
            margin-top: 15px;
        }

        .login-box a:hover {
            text-decoration: underline;
        }

        .error {
            color: #ff4c4c;
            margin-top: 12px;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Login</h2>

        <form action="LoginServ" method="post">
            <input type="hidden" name="action" value="login" />

            <label for="email">Email:</label>
            <input type="email" name="email" required />

            <label for="password">Password:</label>
            <input type="password" name="password" required />

            <input type="submit" value="Login" />
        </form>

        <a href="register.jsp">New user? Register here</a>

        <% String error = request.getParameter("error");
           if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>
    </div>
</body>
</html>
