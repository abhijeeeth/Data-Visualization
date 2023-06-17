
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : login
    Created on : Apr 18, 2023, 8:16:20 PM
    Author     : chaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Matteo Bruni">
    <title>visualNsight</title>

    <!-- Custom styles for this template -->
    <link href="css/particles.css" rel="stylesheet"/>
    <link href="css/auth.css" rel="stylesheet"/>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
    <title>VisualNSight</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
  
    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
  
    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  
    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">
</head>

<body>
      <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
<!--         Uncomment the line below if you also wish to use an image logo 
-->         <img src="assets/img/logo.png" alt=""> 
        <h1 class="d-flex align-items-center">Accident Data</h1>
        

      </a>

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

      <nav id="navbar" class="navbar">
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
<div id="tsparticles">
<main class="box">
    <h2>Insert Data</h2>
<form>
    <div class="inputBox">
		<label for="accidentid">Accident year :</label>
		<select name="ayear" required>
	<option value="">Select year</option>
	<option value="2023">2023</option>
	<option value="2022">2022</option>
	<option value="2021">2021</option>
	<option value="2020">2020</option>
	<option value="2019">2019</option>
        <option value="2018">2018</option>
	<!-- Add more options as needed -->
</select><br><br>

    </div>
    <div class="inputBox">
		<label for="accidentid">LMV:</label>
		<input type="text" name="lmv" required><br><br>
    </div>
    <div class="inputBox">
		<label for="accidentid">MotorCycle :</label>
		<input type="text" name="motorcycle" required><br><br>
    </div>
    <div class="inputBox">
		<label for="accidentid">Heavy Vehicle :</label>
		<input type="text" name="heavy_vehicles" required><br><br>
    </div>
		
		<input type="submit" value="Add_Data" name="addd" />
                <input type="submit" value="Update_Data" name="upd"/>
	</form>
    </div>
</main>
<footer>
</footer>

<script type="text/javascript" src="js/particles.js"></script>


<%-- Insert data into the database --%>
<%@ page import="java.sql.*" %>
   <% 
    if ("Add_Data".equals(request.getParameter("addd"))) {
        String year = request.getParameter("ayear");
        String lmv = request.getParameter("lmv");
        String motorcycle = request.getParameter("motorcycle");
        String heavy_vehicles = request.getParameter("heavy_vehicles");

        // JDBC driver name, database URL, username and password
    // Establish a database connection
    String driverClass ="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/mydatabase";
    String user = "root";
    String pass = "root";
    Class.forName(driverClass).newInstance();
    Connection conn = DriverManager.getConnection(url, user, pass);



        String sql = "INSERT INTO accidents (accident_year, lmv, motorcycle, heavy_vehicles) VALUES (?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, year);
        statement.setString(2, lmv);
        statement.setString(3, motorcycle);
        statement.setString(4, heavy_vehicles);
        statement.executeUpdate();


        // Clean-up environment
        statement.close();
        conn.close();
    }
        // Check if the form has been submitted
    if ("Update_Data".equals(request.getParameter("upd"))) {
        
        // Get the data from the form
        String year = request.getParameter("ayear");
        String lmv = request.getParameter("lmv");
        String motorcycle = request.getParameter("motorcycle");
        String heavy_vehicles = request.getParameter("heavy_vehicles");
        
        // Connect to the database
        String driverClass = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/mydatabase";
        String user = "root";
        String pass = "root";
        Class.forName(driverClass).newInstance();
        Connection conn = DriverManager.getConnection(url, user, pass);
        
        // Prepare the SQL statement
        String sql = "UPDATE accidents SET lmv=?, motorcycle=?, heavy_vehicles=? WHERE accident_year=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, lmv);
        statement.setString(2, motorcycle);
        statement.setString(3, heavy_vehicles);
        statement.setString(4, year);
        
        // Execute the statement
        int rowsUpdated = statement.executeUpdate();
        
        // Check if the update was successful
        if (rowsUpdated > 0) {
            out.println("Accident data updated successfully.");
        } else {
            out.println("Failed to update accident data.");
        }
        
        // Clean up resources
        statement.close();
        conn.close();
    }
%>


</body>

</html>