<%@ page import="Model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home - Movie Booking</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #121212;
            color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 1px;
        }
        .nav-link.disabled {
            color: #bbb !important;
            font-weight: 600;
            user-select: none;
        }
        .container {
            flex: 1;
        }
        h3 {
            font-weight: 700;
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        .btn {
            font-weight: 600;
            font-size: 1.1rem;
            padding: 14px 0;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(13, 110, 253, 0.3);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .btn:hover, .btn:focus {
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(13, 110, 253, 0.6);
        }
        .btn-primary {
            background: linear-gradient(45deg, #0d6efd, #6610f2);
            border: none;
        }
        .btn-secondary {
            background: linear-gradient(45deg, #6c757d, #343a40);
            border: none;
        }
        .btn-warning {
            background: linear-gradient(45deg, #ffc107, #ff6f00);
            border: none;
            color: #212529;
        }
        .row.g-4 > div {
            display: flex;
            justify-content: center;
        }
        footer {
            text-align: center;
            padding: 15px 0;
            background: #1e1e1e;
            color: #666;
            font-size: 0.9rem;
            margin-top: auto;
        }
        @media (max-width: 767.98px) {
            .btn {
                font-size: 1rem;
                padding: 12px 0;
            }
        }
        h3 {
        	text-align:center;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarAdmin" aria-controls="navbarAdmin" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarAdmin">
                <ul class="navbar-nav ms-auto align-items-center gap-3">
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Welcome, <%= user.getName() %></a>
                    </li>
                    <li class="nav-item">
                       <!--  <a class="nav-link text-danger fw-bold" href="../LogoutServlet">Logout</a> -->
                        <a class="nav-link text-danger fw-bold" href="<%= request.getContextPath() %>/logout">Logout</a>
                        
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5" style="max-width: 400px;">
    <h3>Admin Dashboard</h3>
    <div class="d-grid gap-4">
        <a href="changeMovies.jsp" class="btn btn-primary shadow btn-lg">Change Current Movies</a>
        <a href="../changeUpcomingServlet" class="btn btn-secondary shadow btn-lg">Change Upcoming Movies</a>
        <a href="<%=request.getContextPath()%>/changeCredentials.jsp" class="btn btn-warning shadow btn-lg text-dark">Change Credentials</a>
    </div>
</div>


    <footer>
        &copy; 2025 Movie Booking Admin Panel. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
