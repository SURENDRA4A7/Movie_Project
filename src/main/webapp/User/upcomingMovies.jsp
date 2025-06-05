<%@ page import="java.util.*, modelDB.MovieDB, Model.Movies" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Upcoming Movies</title>
    <style>
    	body {
		    background-image: url('<%=request.getContextPath()%>/Images/prabhas_10.jpg');
		    background-size: cover;
		    background-position: center;
		    background-repeat: no-repeat;
		    font-family: Arial, sans-serif;
		    color: #fff;
		    min-height: 100vh;
		}


	    h2 {
	        text-align: center;
	        margin-top: 20px;
	        font-size: 36px;
	        text-shadow: 2px 2px 4px #000;
	    }

	    .movie-container {
	        display: flex;
	        flex-wrap: wrap;
	        justify-content: center;
	        gap: 20px;
	        padding: 20px;
	    }

	    .movie-box {
	        background-color: rgba(0, 0, 0, 0.7);
	        border: 1px solid #888;
	        border-radius: 10px;
	        padding: 15px;
	        width: 300px;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
	        transition: transform 0.3s;
	    }

	    .movie-box:hover {
	        transform: scale(1.05);
	    }

	    .movie-box img {
	        width: 100%;
	        height: 200px;
	        border-radius: 8px;
	        object-fit: cover;
	        margin-bottom: 10px;
	    }

	    .movie-box strong {
	        color: #ffcc00;
	    }

	    .movie-box p {
	        margin: 5px 0;
	    }
	</style>

</head>
<body>
    <h2>Upcoming Movies</h2>
    <div class="movie-container">
	<%
	    List<Movies> upcomingMovies = MovieDB.getUpcomingMovies();
	    for (Movies movie : upcomingMovies) {
	%>
	
    <div class="movie-box">
    	
    
        <img src="<%= request.getContextPath() + "/" + movie.getImageUrl() %>" alt="Movie Poster" /><br/>
        <strong>Title:</strong> <%= movie.getTitle() %><br/>
        <strong>Language:</strong> <%= movie.getLanguage() %><br/>
        <strong>Genre:</strong> <%= movie.getGenre() %><br/>
        <strong>Description:</strong> <%= movie.getDescription() %><br/>
        <strong>Status:</strong> <%= movie.getStatus() %>
    </div>
    
	<%
    	}
	%>
</div>

</body>
</html>
