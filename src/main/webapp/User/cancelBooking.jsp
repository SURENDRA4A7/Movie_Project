<%@ page import="modelDB.BookingDB" %>

<%
    String bookingIdStr = request.getParameter("bookingId");

    if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            boolean success = BookingDB.cancelBooking(bookingId);

            if (success) {
%>
                <script>
                    alert("Booking cancelled successfully.");
                    window.location.href = "myBookings.jsp";
                </script>
<%
            } else {
%>
                <script>
                    alert("Cancellation failed.");
                    window.location.href = "myBookings.jsp";
                </script>
<%
            }
        } catch (NumberFormatException e) {
%>
            <script>
                alert("Invalid booking ID.");
                window.location.href = "myBookings.jsp";
            </script>
<%
        }
    } else {
%>
        <script>
            alert("No booking ID provided.");
            window.location.href = "myBookings.jsp";
        </script>
<%
    }
%>
