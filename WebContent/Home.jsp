<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Full Slider - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="homeasset/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="indexasset/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="homeasset/css/full-slider.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.homeasset/js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    style<style type="text/css">
    
    .carousel-caption > a {
    background:none;
   /*  border:#fff; */
    box-shadow:none;
    font: bold;
    border-color: #fff;
    font-style: oblique;
    font-weight:bolder; 
    color: #fff;
}

.btn:hover {
background-color: #e6e6efa;

}
    
    </style>

</head>

<body>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!-- <a class="navbar-brand" href="Home.jsp"><i class="fa fa-home"></i>  <span class="light">House</span> Rent</a> -->
      <a class="navbar-brand" href="Home.jsp"><img alt="HouseRent" src="images/logo.png" width="140" height="35"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="Home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
      	<li><a href="tenant/SearchHouse.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>
      	<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Settings <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="UpdateUserInfo.jsp">Update Your Info</a></li>
            <li><a href="PostTable.jsp">Update Ad Info</a></li>
          </ul>
        </li>
        <li><a href="ContactUs.jsp"><span class="glyphicon glyphicon-envelope"></span>Contact Us</a></li>
        <li><a href="Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

    <!-- Full Page Image Background Carousel Header -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <!-- <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
 -->
        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url('images/image2.jpg');"></div>
                <div class="carousel-caption">
                <h1>Nobody can serve you the best... We can...</h1>
                    <a href="owner/OwnerForm.jsp" class="btn btn-default btn-lg">Owner</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="tenant/SearchHouse.jsp" class="btn btn-default btn-lg">Tenant</a>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('images/image3.jpg');"></div>
                 <div class="carousel-caption">
                 <h1>Nobody can serve you the best... We can...</h1>
                    <a href="owner/OwnerForm.jsp" class="btn btn-default btn-lg">Owner</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="tenant/SearchHouse.jsp" class="btn btn-default btn-lg">Tenant</a>
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image:url('images/image1.jpg');"></div>
                <div class="carousel-caption">
                <h1>Nobody can serve you the best... We can...</h1>
                    <a href="owner/OwnerForm.jsp" class="btn btn-default btn-lg">Owner</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="tenant/SearchHouse.jsp" class="btn btn-default btn-lg">Tenant</a>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header>

    <!-- jQuery -->
    <script src="homeasset/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="homeasset/js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>
<%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("Login.jsp");
 }
 %>

