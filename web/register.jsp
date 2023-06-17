<!doctype html>
<html lang="en">
<%@ page import="java.sql.*" %>

<%
     if ("Register".equals(request.getParameter("breg"))) {
    // Get the user data submitted from the form
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String password = request.getParameter("password");

    // Establish a database connection
    String driverClass ="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/mydatabase";
    String user = "root";
    String pass = "root";
    Class.forName(driverClass).newInstance();
    Connection conn = DriverManager.getConnection(url, user, pass);

    // Insert the user data into the database
    String sql = "INSERT INTO users (username, name, password) VALUES (?, ?, ?)";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, username);
    stmt.setString(2, name);
    stmt.setString(3, password);
    int rowsInserted = stmt.executeUpdate();

    // Check if the insert was successful
    if (rowsInserted > 0) {
        out.println("User inserted successfully.");
    } else {
        out.println("Failed to insert user.");
    }

    // Close the database connection
    stmt.close();
    conn.close();
    response.sendRedirect("login.jsp");
     }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Matteo Bruni">
    <title>Register Template - tsParticles</title>

    <!-- Custom styles for this template -->
    <link href="css/particles.css" rel="stylesheet"/>
    <link href="css/auth.css" rel="stylesheet"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Matteo Bruni">
    <title>Signin Template - tsParticles</title>

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
 <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="d-flex align-items-center">VisualNSight</h1>
      </a>

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

      <nav id="navbar" class="navbar">
<!--        <ul>
          <li><a href="index.html" class="active">Home</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="login.html">login</a></li>
          <li><a href="team.html">Team</a></li>
          <li><a href="blog.html">Blog</a></li>
          <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="#">Dropdown 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">Deep Dropdown 1</a></li>
                  <li><a href="#">Deep Dropdown 2</a></li>
                  <li><a href="#">Deep Dropdown 3</a></li>
                  <li><a href="#">Deep Dropdown 4</a></li>
                  <li><a href="#">Deep Dropdown 5</a></li>
                </ul>
              </li>
              <li><a href="#">Dropdown 2</a></li>
              <li><a href="#">Dropdown 3</a></li>
              <li><a href="#">Dropdown 4</a></li>
            </ul>
          </li>
          <li><a href="contact.html">Contact</a></li>
        </ul>-->
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
<div id="tsparticles"></div>
<main class="box">
    <h2>Create New Account</h2>
    <form>
      <div class="inputBox">
        <label for="userName">username</label>
        <input type="text" name="username" placeholder="Username" required/>
    </div>
        <div class="inputBox">
            <label for="Name">Name</label>
            <input type="text" name="name" placeholder="Name" required/>
        </div>
        <div class="inputBox">
            <label for="userPassword">Password</label>
            <input type="password" name="password" placeholder="password"
                   required/>
        </div>
<!--        <div class="inputBox">
            <label for="userConfirmPassword">Confirm Password</label>
            <input type="password" name="tpass" placeholder="confirm your password"
                   required/>
        </div>-->
         <input type="submit" value="Register" name="breg" />
        <a class="button" href="login.html" style="float: left;">Login</a>
    </form>
</main>
<footer>
</footer>


<script type="text/javascript" src="js/particles.js"></script>
</body>
</html>
