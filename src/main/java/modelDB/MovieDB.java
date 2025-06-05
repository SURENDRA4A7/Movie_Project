package modelDB;



import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.Movies;
import modelConnection.GetConnection;

public class MovieDB {

    // Method to fetch all movies from the database
	public static List<Movies> getAllMovies() {
	    List<Movies> movies = new ArrayList<>();

	    try {
	        Connection conn = GetConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement("SELECT * FROM movies");
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Movies movie = new Movies();
	            movie.setId(rs.getInt("id"));
	            movie.setTitle(rs.getString("title"));
	            movie.setImageUrl(rs.getString("image_url"));
	            movie.setLanguage(rs.getString("language"));
	            movie.setGenre(rs.getString("genre"));
	            movie.setStatus(rs.getString("status"));
	            movie.setDescription(rs.getString("description"));

	            movies.add(movie);
	        }

	        rs.close();
	        ps.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return movies;
	}



    // Method to fetch a movie by its ID
	public static Movies getMovieById(int movieId) {
	    Movies movie = null;
	    try {
	        Connection conn = GetConnection.getConnection();
	        String query = "SELECT * FROM movies WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, movieId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            movie = new Movies();
	            movie.setId(rs.getInt("id"));
	            movie.setTitle(rs.getString("title"));
	            movie.setImageUrl(rs.getString("image_url"));
	            movie.setLanguage(rs.getString("language"));
	            movie.setGenre(rs.getString("genre"));
	            movie.setStatus(rs.getString("status"));
	            movie.setDescription(rs.getString("description"));
	        }

	        rs.close();
	        ps.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return movie;
	}


    // Method to add a new movie (for Admin use)
	public static boolean addMovie(Movies movie) {
	    boolean success = false;
	    try {
	        Connection conn = GetConnection.getConnection();
	        String query = "INSERT INTO movies (title, image_url, language, genre, status,description) VALUES (?, ?, ?, ?, ?,?)";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setString(1, movie.getTitle());
	        ps.setString(2, movie.getImageUrl());
	        ps.setString(3, movie.getLanguage());
	        ps.setString(4, movie.getGenre());
	        ps.setString(5, movie.getStatus());
	        ps.setString(6, movie.getDescription());

	        int rows = ps.executeUpdate();
	        success = rows > 0;

	        ps.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return success;
	}


    // Method to update a movie's details (for Admin use)
	public static boolean updateMovie(Movies movie) {
	    boolean success = false;
	    try {
	        Connection conn = GetConnection.getConnection();
	        String query = "UPDATE movies SET title=?, image_url=?, language=?, genre=?, status=?, description=? WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setString(1, movie.getTitle());
	        ps.setString(2, movie.getImageUrl());
	        ps.setString(3, movie.getLanguage());
	        ps.setString(4, movie.getGenre());
	        ps.setString(5, movie.getStatus());
	        ps.setString(6, movie.getDescription());
	        ps.setInt(7, movie.getId());

	        int rows = ps.executeUpdate();
	        success = rows > 0;

	        ps.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return success;
	}
	
	
	// Method to fetch movies by status (e.g., "now_showing", "upcoming")
	public static List<Movies> getUpcomingMovies() {
	    List<Movies> list = new ArrayList<>();
	    try {
	        Connection conn = GetConnection.getConnection();
	        String query = "SELECT * FROM movies WHERE status = ?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setString(1, "upcoming");  // use lowercase consistently
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Movies m = new Movies();
	            m.setId(rs.getInt("id"));
	            m.setTitle(rs.getString("title"));
	            m.setImageUrl(rs.getString("image_url"));
	            m.setLanguage(rs.getString("language"));
	            m.setGenre(rs.getString("genre"));
	            m.setStatus(rs.getString("status"));
	            m.setDescription(rs.getString("description"));
	            list.add(m);
	        }
	        rs.close();
	        ps.close();
	        conn.close();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}





    // Method to delete a movie (for Admin use)
    public static boolean deleteMovie(int movieId) {
        boolean success = false;
        try {
            Connection conn = GetConnection.getConnection();
            String query = "DELETE FROM movies WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, movieId);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                success = true;
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    
}
