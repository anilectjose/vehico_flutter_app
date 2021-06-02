<?php
include 'db2.php';

$result=mysqli_query($con,"SELECT * FROM `work_db` join worker_registration_db on worker_registration_db.worker_id =work_db.worker_id join work_type_db on work_type_db.type_id=work_db.work_type_id WHERE work_db.status=1 ORDER BY work_db.work_id asc");

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>View requests</title>
    <!-- Favicon-->
    <link rel="icon" href="favicon.png" type="image/png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <link href="plugins/morrisjs/morris.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="css/themes/all-themes.css" rel="stylesheet" />
        <style type="text/css">    
    #submit {
      margin: auto;
      background-color: var(--background-c, lightgray);
      border-radius: 8px;
      padding: 5px 12px 5px 12px;
      margin-top: 5px;
      font-size: 85%;
    }

    input[type=submit] {
      width: 80px;
      background-color: #4CAF50;
      color: white;
      padding: 10px;
      margin: 4px 0 0 20px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
    }
    input[type=reset] {
      width: 80px;
      background-color: #ff3939;
      color: white;
      padding: 10px;
      margin: 4px 0 0 80px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
    }
    input[type=submit]:hover {
      background-color: #000000;
    }
    input[type=reset]:hover {
      background-color: #000000;
    }
  </style>
</head>

<body class="theme-red">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
   <?php
    include 'topbar.php';
    ?>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <?php
         include 'SideBar.php';
         ?>
       
        <!-- #END# Right Sidebar -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>View Requests</h2>
            </div>

            <!-- Widgets -->
            <?php 
            $count=0;
            while ($row = mysqli_fetch_assoc($result)) { $count++;   ?>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="header bg-green">
                            <h2>
                                <?php echo $row["company"]; ?> <small><?php echo $row["type_name"]; ?></small>
                            </h2> 
                        </div>
                        <div class="body">
                            <b>Place :</b><?php echo $row["place"]; ?><br>
                            <b>Number :</b><?php echo $row["number"]; ?><br>
                            <b>Worker Name :</b><?php echo $row["worker_name"]; ?><br>
                            <b>Worker mobile :</b><?php echo $row["w_mobile"]; ?><br><br>
                        </div>
                    </div>
                </div><?php } ?>

    <!-- Jquery Core Js -->
      <?php
    include 'Script.php';
    ?>
</body>

</html>
