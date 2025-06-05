<%@ page import="Model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Home - Movie Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('Images/BG.jpg'); /* adjust path as needed */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.85) !important;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.6rem;
        }

        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard-box {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.6);
            width: 100%;
            max-width: 400px;
        }

        h3 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 10px;
        }

        .btn {
            font-weight: 600;
            font-size: 1.1rem;
            padding: 14px;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(255, 255, 255, 0.3);
        }

        .btn-primary {
            background: linear-gradient(45deg, #0d6efd, #6610f2);
            border: none;
        }

        .btn-success {
            background: linear-gradient(45deg, #198754, #28a745);
            border: none;
        }

        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #ff0033);
            border: none;
        }

        .btn-warning {
            background: linear-gradient(45deg, #ffc107, #ff8800);
            color: #212529;
            border: none;
        }

        footer {
            text-align: center;
            color: #ccc;
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.8);
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Movie Booking</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarUser" aria-controls="navbarUser" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarUser">
                <ul class="navbar-nav ms-auto align-items-center gap-3">
                    <li class="nav-item">
                        <a class="nav-link disabled fw-semibold" href="#">Welcome, <%= user.getName() %></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger fw-bold" href="<%= request.getContextPath() %>/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Dashboard -->
    <div class="container">
        <div class="dashboard-box">
            <h3>Movie Dashboard</h3>
            <div class="d-grid gap-3">
                <a href="bookTicket.jsp" class="btn btn-primary">Book Tickets</a>
                <a href="upcomingMovies.jsp" class="btn btn-success">Upcoming Movies</a>
                <a href="cancelBooking.jsp" class="btn btn-danger">Cancel Tickets</a>
                <a href="<%=request.getContextPath()%>/changeCredentials.jsp" class="btn btn-warning">Change Credentials</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2025 Movie Booking App. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
