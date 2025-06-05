<%@ page import="Model.User" %>
<%@ page import="Model.Booking" %>
<%@ page import="modelDB.BookingDB" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("../Login.jsp");
        return;
    }

    List<Booking> bookingList = BookingDB.getBookingsByUserId(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">Movie Booking</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link disabled">Welcome, <%= user.getName() %></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-danger" href="../LogoutServlet">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h3 class="mb-4">My Bookings</h3>

    <%
        if (bookingList.isEmpty()) {
    %>
        <div class="alert alert-info">You have no bookings.</div>
    <%
        } else {
    %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Movie ID</th>
                    <th>Tickets</th>
                    <th>Showtime</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% for (Booking b : bookingList) { %>
                <tr>
                    <td><%= b.getId() %></td>
                    <td><%= b.getMovieId() %></td>
                    <td><%= b.getTickets() %></td>
                    <td><%= b.getShowtime() %></td>
                    <td>
                        <form action="cancelBooking.jsp" method="post" onsubmit="return confirm('Cancel this booking?');">
                            <input type="hidden" name="bookingId" value="<%= b.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Cancel</button>
                        </form>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    <%
        }
    %>
</div>

</body>
</html>
