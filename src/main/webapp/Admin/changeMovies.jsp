<%@ page language="java" %>
<%@ page import="Model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("../Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Movie Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 30px;
            margin-top: 50px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #343a40;
            font-weight: 700;
        }
        label {
            font-weight: 600;
            color: #495057;
        }
        .btn-primary {
            background-color: #0069d9;
            border: none;
            font-weight: 600;
            padding: 10px 25px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #004085;
        }
        .alert {
            font-weight: 600;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Movie Details</h2>

    <form action="../changeMoviesServlet" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">Movie ID:</label>
            <input type="number" class="form-control" id="id" name="id" required />
        </div>

        <div class="mb-3">
            <label for="title" class="form-label">Title:</label>
            <input type="text" class="form-control" id="title" name="title" required />
        </div>

        <div class="mb-3">
            <label for="imageUrl" class="form-label">Image URL:</label>
            <input type="text" class="form-control" id="imageUrl" name="imageUrl" required />
        </div>

        <div class="mb-3">
            <label for="language" class="form-label">Language:</label>
            <input type="text" class="form-control" id="language" name="language" required />
        </div>

        <div class="mb-3">
            <label for="genre" class="form-label">Genre:</label>
            <input type="text" class="form-control" id="genre" name="genre" required />
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Status:</label>
            <select class="form-select" id="status" name="status" required>
                <option value="">Select status</option>
                <option value="Now Showing">Now Showing</option>
                <option value="Upcoming">Upcoming</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary w-100">Update Movie</button>
    </form>

    <% if (request.getParameter("msg") != null) { %>
        <div class="alert alert-success mt-4"><%= request.getParameter("msg") %></div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger mt-4">Failed to update movie. Try again.</div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
