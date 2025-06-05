package com.Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelDB.MovieDB;

import java.io.IOException;

import Model.Movies;



/**
 * Servlet implementation class UpdateUpcomingServlet
 */
//@WebServlet("/UpdateUpcomingServlet")
public class UpdateUpcomingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUpcomingServlet() {
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
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String imageUrl = request.getParameter("imageUrl");
            String language = request.getParameter("language");
            String genre = request.getParameter("genre");
            String status = request.getParameter("status").toLowerCase(); // normalize
            String description = request.getParameter("description");

            Movies m = new Movies();
            m.setId(id);
            m.setTitle(title);
            m.setImageUrl(imageUrl);
            m.setLanguage(language);
            m.setGenre(genre);
            m.setStatus(status);
            m.setDescription(description);

            boolean updated = MovieDB.updateMovie(m);
            if (updated) {
                response.sendRedirect("Admin/changeUpcoming.jsp?success=Movie updated successfully");
            } else {
                response.sendRedirect("Admin/changeUpcoming.jsp?error=Update failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Admin/changeUpcoming.jsp?error=Invalid data");
        }
	}

}
