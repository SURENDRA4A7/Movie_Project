package com.Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelDB.MovieDB;

import java.io.IOException;


import Model.Movies;

/**
 * Servlet implementation class changeMoviesServlet
 */
//@WebServlet("/changeMoviesServlet")
public class changeMoviesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeMoviesServlet() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
            Movies movie = new Movies();
            movie.setId(Integer.parseInt(request.getParameter("id")));
            movie.setTitle(request.getParameter("title"));
            movie.setImageUrl(request.getParameter("imageUrl"));
            movie.setLanguage(request.getParameter("language"));
            movie.setGenre(request.getParameter("genre"));
            movie.setStatus(request.getParameter("status"));
            movie.setDescription(request.getParameter("description"));

            boolean updated = MovieDB.updateMovie(movie); // or AdminDAO if your DAO is separate

            if (updated) {
                response.sendRedirect("Admin/changeMovies.jsp?msg=Movie updated successfully");
            } else {
                response.sendRedirect("Admin/changeMovies.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Admin/changeMovies.jsp?error=1");
        }
	}

}
