<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>House Rent&copy;</title>

    <!-- Bootstrap Core CSS -->
    <link href="indexasset/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="indexasset/css/grayscale.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="indexasset/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <i class="fa fa-home animated"></i>  <span class="light">House</span>Rent
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="Login.jsp"><i class="fa fa-user animated"></i> Login</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about"><i class="fa fa-info animated"></i> About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#signup"><i class="fa fa-user animated"></i><sup><i class="fa fa-plus animated"></i></sup> SignUp</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact"><i class="fa fa-envelope animated"></i> Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Header -->
    <header class="intro">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading"><i class="fa fa-home animated"></i>HouseRent</h1>
                        <h3>House rentals in seconds.</h3>
                        <p class="intro-text">Search the most comprehensive online database for single-family home rentals..</p>
                        <a href="Login.jsp" class="btn btn-default btn-lg ">
                           <i class="fa fa-user animated"></i> Login
                        </a>
					  <a href="#about" class="btn btn-default btn-lg page-scroll">
                          More <i class="fa fa-angle-double-down animated"></i>
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- About Section -->
    <section id="about" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>About HouseRent</h2>
                <p>House Rent is India’s no.1 online house/room classifieds platform, a place where people can connect with each other to buy or sell or rent out house or rooms. Launched in 2015 with the vision for buyers and sellers to “meet online, transact offline”, today we have over 4.2 million listings and have generated over 150 million replies.</p>
            </div>
        </div>
    </section>

    <!-- Signup Section -->
    <section id="signup" class="content-section text-center">
        <div class="download-section">
            <div class="container">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2></h2>
                    <p>Create a free account on HouseRent.</p>
                    <a href="Registration.jsp" class="btn btn-default btn-lg"><i class="fa fa-user animated"></i><sup><i class="fa fa-plus animated"></i></sup> SignUp</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Contact House Rent</h2>
                <p>Feel free to email us to provide some feedback on our services, give us suggestions for new UI and quality, or to just say hello!</p>
                <p><a href="mailto:info@houserent.com">info@houserent.com</a>
                </p>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://twitter.com/#" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw animated"></i> <span class="network-name">Twitter</span></a>
                    </li>
                    <li>
                        <a href="https://facebook.com/page/#" class="btn btn-default btn-lg"><i class="fa fa-facebook fa-fw animated"></i> <span class="network-name">Facebook</span></a>
                    </li>
                    <li>
                        <a href="https://plus.google.com/#" class="btn btn-default btn-lg"><i class="fa fa-google-plus fa-fw animated"></i> <span class="network-name">Google+</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <div id="map"></div>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Copyright &copy; HouseRent 2015</p>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="indexasset/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="indexasset/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="indexasset/js/jquery.easing.min.js"></script>

    <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUxkptkiGsmvyiFQ5KYkYY09fewVH7xZA&sensor=false"></script>

    <!-- Custom Theme JavaScript -->
    <script src="indexasset/js/grayscale.js"></script>

</body>

</html>
