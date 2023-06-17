<%@ page import="java.sql.*" %>
<%
    String driverClass ="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/mydatabase";
    String user = "root";
    String pass = "root";
    Class.forName(driverClass).newInstance();
    Connection conn = DriverManager.getConnection(url, user, pass);

    String sql = "SELECT * FROM accidents WHERE accident_year=2019";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    String accidentYear = "";
    String lmv = "";
    String motorcycle = "";
    String heavyVehicles = "";

    while(rs.next()) {
        accidentYear += "'" + rs.getString("accident_year") + "',";
        lmv += rs.getInt("lmv") + ",";
        motorcycle += rs.getInt("motorcycle") + ",";
        heavyVehicles += rs.getInt("heavy_vehicles") + ",";
    }

    rs.close();
    stmt.close();
    conn.close();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Accident Data Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
</head>
<body class="page-index">
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

<!--      <a href="index.html" class="logo d-flex align-items-center">-->
<!--         Uncomment the line below if you also wish to use an image logo 
-->         <img src="assets/img/logo.png" alt=""> 
        <h1 class="d-flex align-items-center">Accident Data Of 2018</h1>
    <canvas id="myChart"></canvas>
    <script>
        var accidentYear = [<%= accidentYear %>];
        var lmvData = [<%= lmv %>];
        var motorcycleData = [<%= motorcycle %>];
        var heavyVehiclesData = [<%= heavyVehicles %>];

        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: accidentYear,
                datasets: [
                    {
                        label: 'Light Motor Vehicle',
                        data: lmvData,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Motorcycle',
                        data: motorcycleData,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Heavy Vehicles',
                        data: heavyVehiclesData,
                        backgroundColor: 'rgba(255, 206, 86, 0.2)',
                        borderColor: 'rgba(255, 206, 86, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
    
</body>
</html>
