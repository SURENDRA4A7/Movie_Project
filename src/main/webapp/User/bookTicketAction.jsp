<%@ page import="Model.Booking" %>
<%@ page import="modelDB.BookingDB" %>
<%@ page import="Model.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page session="true" %>

<%
    // Get the current logged-in user from the session
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("../Login.jsp");
        return;
    }

    try {
        // Fetch form data
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        int tickets = Integer.parseInt(request.getParameter("tickets"));
        String showtimeStr = request.getParameter("showtime");

        // Convert the showtime string to a Date object
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date showtimeDate = sdf.parse(showtimeStr);
        
        // Convert Date to LocalDateTime (for consistency with the model)
        java.time.LocalDateTime showtime = showtimeDate.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDateTime();

        // Create a new Booking object
        Booking booking = new Booking();
        booking.setUserId(user.getId());
        booking.setMovieId(movieId);
        booking.setTickets(tickets);
        booking.setShowtime(showtime);

        // Save the booking using the BookingDAO
        boolean success = BookingDB.saveBooking(booking);

        if (success) {
%>
            <script>
                alert("Booking successful!");
                window.location.href = "home.jsp";  // Redirect to home page or booking list
            </script>
<%
        } else {
%>
            <script>
                alert("Booking failed. Please try again.");
                window.location.href = "bookTicket.jsp";  // Redirect back to the booking page
            </script>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("An error occurred. Please try again.");
            window.location.href = "bookTicket.jsp";  // Redirect back to the booking page
        </script>
<%
    }
%>
