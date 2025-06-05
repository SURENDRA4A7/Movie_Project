package modelDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Booking;
import modelConnection.GetConnection;

public class BookingDB {

    public static boolean saveBooking(Booking booking) {
        boolean success = false;

        try {
            Connection conn = GetConnection.getConnection();
            String sql = "INSERT INTO tickets (user_id, movie_id, tickets, showtime) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getMovieId());
            ps.setInt(3, booking.getTickets());
            ps.setTimestamp(4, java.sql.Timestamp.valueOf(booking.getShowtime()));

            int rows = ps.executeUpdate();
            success = rows > 0;
            System.out.println(rows +" updated ");

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
    public static List<Booking> getBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();

        try {
            Connection conn = GetConnection.getConnection();
            String sql = "SELECT t.id, t.movie_id, t.tickets, t.showtime, m.title FROM tickets t INNER JOIN movies m ON t.movie_id = m.id WHERE t.user_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("id"));
                booking.setMovieId(rs.getInt("movie_id"));
                booking.setTickets(rs.getInt("tickets"));
                booking.setShowtime(rs.getTimestamp("showtime").toLocalDateTime());

                // Optional: add movie title support if you update the Booking model
                // booking.setMovieTitle(rs.getString("title"));

                bookings.add(booking);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public static boolean cancelBooking(int bookingId) {
        boolean success = false;
        try {
            Connection conn = GetConnection.getConnection();
            String sql = "DELETE FROM tickets WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookingId);
            success = ps.executeUpdate() > 0;
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

}
