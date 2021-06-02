<?php
//$user=$_SESSION['login_admin'];

    // $query=mysqli_query($con,"SELECT * FROM role_db JOIN admin_db ON role_db.login_id=admin_db.login_id where role_db.login_id='$user'");
    // $arr1=mysqli_fetch_assoc($query);

?>
   <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="images/user.png" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php //echo $arr1['username']; ?>Admin</div>
                    <div class="email"><?php //echo $arr1['Email']; ?>Admin@Orvba.com</div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="logout.php"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="active">
                        <a href="dashboard.php">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="orders.php">
                            <i class="material-icons">add_circle</i>
                            <span>Orders</span>
                        </a>
                    </li>
                    <li>
                        <a href="works.php">
                            <i class="material-icons">add_comment</i>
                            <span>Works</span>
                        </a>
                    </li>
                    <li>
                        <a href="workers_req.php"> 
                            <i class="material-icons">emoji_people</i>
                            <span>Accept requests</span>
                        </a>
                    </li>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2021 <a href="">Orvba</a>.
                </div>
                <div class="version">
                    <b>Version: </b> 1.0.1  
                </div>
            </div>
            <!-- #Footer -->
        </aside>

         <!-- #END# Left Sidebar -->
