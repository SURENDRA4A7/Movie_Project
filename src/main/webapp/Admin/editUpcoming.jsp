<%@ page import="modelDB.MovieDB" %>
<%@ page import="Model.Movies" %>
<%@ page import="Model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("../Login.jsp");
        return;
    }

    int movieId = Integer.parseInt(request.getParameter("id"));
    Movies movie = MovieDB.getMovieById(movieId);

    if (movie == null) {
        response.sendRedirect("changeUpcoming.jsp?error=Movie not found");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Upcoming Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">Edit Movie: <%= movie.getTitle() %></h2>

    <form action="../UpdateUpcomingServlet" method="post" class="card p-4 shadow bg-white">
        <input type="hidden" name="id" value="<%= movie.getId() %>">

        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-control" value="<%= movie.getTitle() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Image URL</label>
            <input type="text" name="imageUrl" class="form-control" value="<%= movie.getImageUrl() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Language</label>
            <input type="text" name="language" class="form-control" value="<%= movie.getLanguage() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Genre</label>
            <input type="text" name="genre" class="form-control" value="<%= movie.getGenre() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Status</label>
            <select name="status" class="form-select" required>
                <option value="upcoming" <%= "upcoming".equalsIgnoreCase(movie.getStatus()) ? "selected" : "" %>>Upcoming</option>
                <option value="now_showing" <%= "now_showing".equalsIgnoreCase(movie.getStatus()) ? "selected" : "" %>>Now Showing</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" rows="4" required><%= movie.getDescription() %></textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-success">Update</button>
            <a href="changeUpcoming.jsp" class="btn btn-secondary ms-2">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
