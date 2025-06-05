package com.Control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import Model.User;
import modelConnection.GetConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/BookTicketServlet")
public class BookTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieName = request.getParameter("movieName");
		String date = request.getParameter("date");
		int seats = Integer.parseInt(request.getParameter("seats"));

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("index.jsp");
			return;
		}

		try {
			Connection conn = GetConnection.getConnection();

			String sql = "INSERT INTO bookings (user_id, movie_name, booking_date, seats) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ps.setString(2, movieName);
			ps.setString(3, date);
			ps.setInt(4, seats);

			int rows = ps.executeUpdate();
			ps.close();
			conn.close();

			if (rows > 0) {
				response.sendRedirect("user/home.jsp?msg=success");
			} else {
				response.sendRedirect("user/bookTicket.jsp?msg=fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("user/bookTicket.jsp?msg=error");
		}
	}
}
