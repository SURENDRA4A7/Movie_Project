package com.Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelDB.UserDB;

import java.io.IOException;

import Model.User;



/**
 * Servlet implementation class changeCredentialServlet
 */
//@WebServlet("/changeCredentialServlet")
public class changeCredentialsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeCredentialsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	User user = (User) request.getSession().getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("Log.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newUsername = request.getParameter("newUsername");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate passwords
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("changeCredentials.jsp?error=Passwords do not match");
            return;
        }

        if (!user.getPassword().equals(currentPassword)) {
            response.sendRedirect("changeCredentials.jsp?error=Current password is incorrect");
            return;
        }

        boolean updated = UserDB.updateUserCredentials(user.getId(),newUsername, newPassword);
        if (updated) {
            user.setName(newUsername);
            user.setPassword(newPassword);
            request.getSession().setAttribute("loggedInUser", user);
            response.sendRedirect("profile.jsp?message=Credentials updated successfully");
        

        } else {
            response.sendRedirect("changeCredentials.jsp?error=Update failed");
        }
    }

}
