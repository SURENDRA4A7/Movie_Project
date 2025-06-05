<%@ page import="java.util.List" %>
<%@ page import="Model.Movies" %>
<%@ page import="java.util.ArrayList" %>

<%
    List<Movies> upcomingList = (List<Movies>) request.getAttribute("upcomingList");
    if (upcomingList == null) {
        upcomingList = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Upcoming Movies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .movie-card {
            background-color: #111;
            color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.5);
            margin-bottom: 20px;
        }
        .movie-details {
            padding: 15px;
        }
        .movie-details span {
            color: #ffc107;
            font-weight: bold;
        }
        .edit-btn {
            text-align: right;
            padding: 0 15px 15px 15px;
        }
    </style>
</head>
<body class="bg-dark text-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Upcoming Movies</h2>
        <div class="row">
            <% for (Movies m : upcomingList) { %>
                <div class="col-md-6">
                    <div class="movie-card">
                        <img src="<%= m.getImageUrl() %>" alt="Poster" class="img-fluid" style="height: 250px; width: 100%; object-fit: cover;">
                        <div class="movie-details">
                            <p><span>Title:</span> <%= m.getTitle() %></p>
                            <p><span>Language:</span> <%= m.getLanguage() %></p>
                            <p><span>Genre:</span> <%= m.getGenre() %></p>
                            <p><span>Description:</span> <%= m.getDescription() %></p>
                            <p><span>Status:</span> upcoming</p>
                        </div>
                        <div class="edit-btn">
                            <a href="Admin/editUpcoming.jsp?id=<%= m.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
