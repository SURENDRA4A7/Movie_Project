package com.Control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelDB.MovieDB;

import java.io.IOException;
import java.util.List;

import Model.Movies;
import Model.User;


/**
 * Servlet implementation class changeUpcomingServlet
 */
//@WebServlet("/changeUpcomingServlet")
public class changeUpcomingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeUpcomingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        if (user == null || !user.getRole().equalsIgnoreCase("admin")) {
            response.sendRedirect("../Login.jsp");
            return;
        }

        List<Movies> upcomingList = MovieDB.getUpcomingMovies();
        request.setAttribute("upcomingList", upcomingList);
        RequestDispatcher rd = request.getRequestDispatcher("/Admin/changeUpcoming.jsp");
        rd.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 
	}

}
