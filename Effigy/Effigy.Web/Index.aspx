<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Effigy.Web.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="style/images/favicon.png" />
    <title>Effigy | Data Feeding and Management </title>
    <link rel="stylesheet" type="text/css" href="style/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="style/css/plugins.css" />
    <link rel="stylesheet" type="text/css" href="style/revolution/css/settings.css" />
    <link rel="stylesheet" type="text/css" href="style/revolution/css/layers.css" />
    <link rel="stylesheet" type="text/css" href="style/revolution/css/navigation.css" />
    <link rel="stylesheet" type="text/css" href="style/css/style.css" />
    <link rel="stylesheet" type="text/css" href="style/css/color/green.css" />
    <link rel="stylesheet" type="text/css" href="style/type/icons.css" />
</head>
<body class="onepage" data-spy="scroll" data-target=".navbar">
    <div class="content-wrapper">
        <nav class="navbar nobg">
            <div class="container">
                <div class="navbar-inner">
                    <div class="navbar-header">
                        <div class="navbar-brand">
                            <a href="index.html">
                                <img src="#" srcset="style/images/logo.png 1x, style/images/logo@2x.png 2x" alt="" /></a>
                        </div>
                        <div class="nav-bars-wrapper">
                            <div class="nav-bars-inner">
                                <div class="nav-bars" data-toggle="collapse" data-target=".navbar-collapse"><span></span></div>
                            </div>
                            <!-- /.nav-bars-inner -->
                        </div>
                        <!-- /.nav-bars-wrapper -->
                    </div>
                    <!-- /.nav-header -->

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="#home">Home</a> </li>
                            <li><a href="#services">Services</a> </li>

                            <li><a href="#about">About</a> </li>
                            <li><a href="#contact">Contact</a> </li>
                            <li><a href="Login.aspx">Login</a> </li>
                            <li><a href="UserRegstration.aspx">Sign Up</a> </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
                <!--/.navbar-inner -->
            </div>
            <!--/.container -->
        </nav>
        <!--/.navbar -->

        <section id="home">
            <div class="light-wrapper">
                <div class="rev_slider_wrapper fullscreen-container">
                    <div id="slider" class="rev_slider fullscreenbanner" data-version="5.4.1">
                        <ul>
                            <li data-transition="parallaxtoright" data-fstransition="fade">
                                <img src="style/images/slider-bg1.jpg" alt="" />
                                <div class="tp-caption light text-center"
                                    data-x="center"
                                    data-y="middle"
                                    data-voffset="['-35','-35','-35','-30']"
                                    data-fontsize="['55','55','45','30']"
                                    data-lineheight="['65','65','55','45']"
                                    data-width="['1100','980','700','450']"
                                    data-textalign="['center','center','center','center']"
                                    data-whitespace="['normal','normal','normal','normal']"
                                    data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeOut"},{"delay":"wait","speed":1000,"frame":"999","to":"y:[175%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                                    data-responsive="on"
                                    data-responsive_offset="on"
                                    style="z-index: 9;">
                                    We believe in the power of
                                </div>
                                <div class="tp-caption light text-center"
                                    data-x="center"
                                    data-y="middle"
                                    data-voffset="['35','35','35','30']"
                                    data-fontsize="['55','55','45','30']"
                                    data-lineheight="['65','65','55','45']"
                                    data-width="['1100','980','700','450']"
                                    data-textalign="['center','center','center','center']"
                                    data-whitespace="['normal','normal','normal','normal']"
                                    data-frames='[{"delay":1500,"speed":2000,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeOut"},{"delay":"wait","speed":1000,"frame":"999","to":"y:[175%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                                    data-responsive="on"
                                    data-responsive_offset="on"
                                    style="z-index: 9;">
                                    creative ideas and great design
                                </div>
                            </li>
                            <li data-transition="parallaxtoleft">
                                <img src="style/images/slider-bg2.jpg" alt="" />
                                <div class="tp-caption light text-center"
                                    data-x="center"
                                    data-y="middle"
                                    data-voffset="['-35','-35','-35','-30']"
                                    data-fontsize="['55','55','45','30']"
                                    data-lineheight="['65','65','55','45']"
                                    data-width="['1100','980','700','450']"
                                    data-textalign="['center','center','center','center']"
                                    data-whitespace="['normal','normal','normal','normal']"
                                    data-frames='[{"from":"x:-50px;opacity:0;","speed":1000,"to":"o:1;","delay":1000,"ease":"Power2.easeOut"},{"delay":"wait","speed":1500,"to":"opacity:0;","ease":"Power4.easeIn"}]'
                                    data-responsive="on"
                                    data-responsive_offset="on"
                                    style="z-index: 9;">
                                    Great design comes with
                                </div>
                                <div class="tp-caption light text-center"
                                    data-x="center"
                                    data-y="middle"
                                    data-voffset="['35','35','35','30']"
                                    data-fontsize="['55','55','45','30']"
                                    data-lineheight="['65','65','55','45']"
                                    data-width="['1100','980','700','450']"
                                    data-textalign="['center','center','center','center']"
                                    data-whitespace="['normal','normal','normal','normal']"
                                    data-frames='[{"from":"x:50px;opacity:0;","speed":1000,"to":"o:1;","delay":1500,"ease":"Power2.easeOut"},{"delay":"wait","speed":1500,"to":"opacity:0;","ease":"Power4.easeIn"}]'
                                    data-responsive="on"
                                    data-responsive_offset="on"
                                    style="z-index: 9;">
                                    understanding customer needs
                                </div>
                            </li>
                        </ul>
                        <div class="tp-bannertimer tp-bottom"></div>
                    </div>
                    <!-- /.rev_slider -->
                </div>
                <!-- /.rev_slider_wrapper -->
            </div>
            <!-- /.light-wrapper -->
        </section>
        <!-- /#home -->
        <section id="about">
            <div class="light-wrapper">
                <div class="container inner">
                    <h2 class="section-title text-center">About Our Company</h2>
                    <p class="lead text-center">A creative agency turning ideas into beautiful things</p>
                    <div class="space20"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <figure>
                                <img src="style/images/art/about.jpg" alt="" />
                            </figure>
                        </div>
                        <!-- /column -->
                        <div class="space30 hidden-xs hidden-md hidden-lg"></div>
                        <div class="col-md-6">
                            <h3>Who is behind all this?</h3>
                            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                            <blockquote>
                                <p>"Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque."</p>
                            </blockquote>
                            <p>Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Donec sed odio dui. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                        </div>
                        <!-- /column -->
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->
            </div>
            <!-- /.light-wrapper -->


        </section>
        <!-- /#about -->
        <section id="services">

            <div class="parallax inverse-wrapper parallax1">
                <div class="container inner">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <h2 class="section-title text-center">Steps in Our Works</h2>
                            <p class="lead text-center">Our process on creating awesome projects.</p>
                            <div class="space30"></div>
                            <div class="row numbered">
                                <div class="col-sm-3 col-xs-6 circle-progress-wrapper">
                                    <div class="circle-progress">
                                        <div class="circle" data-value="25"><i class="budicon-diamond"></i></div>
                                        <h4 class="upper"><span class="number"></span>Creative Ideas</h4>
                                        <p>Maecenas faucibus mollis interdum. Aenean eu leo quam.</p>
                                    </div>
                                </div>
                                <!-- /column -->
                                <div class="col-sm-3 col-xs-6 circle-progress-wrapper">
                                    <div class="circle-progress">
                                        <div class="circle" data-value="50"><i class="budicon-pie-chart"></i></div>
                                        <h4 class="upper"><span class="number"></span>Data Analysis</h4>
                                        <p>Maecenas sed diam eget risus varius blandit sit amet non.</p>
                                    </div>
                                </div>
                                <!-- /column -->
                                <div class="col-sm-3 col-xs-6 circle-progress-wrapper">
                                    <div class="circle-progress">
                                        <div class="circle" data-value="75"><i class="budicon-brush"></i></div>
                                        <h4 class="upper"><span class="number"></span>Magic Touch</h4>
                                        <p>Donec ullamcorper nulla non metus auctor fringilla.</p>
                                    </div>
                                </div>
                                <!-- /column -->
                                <div class="col-sm-3 col-xs-6 circle-progress-wrapper">
                                    <div class="circle-progress">
                                        <div class="circle" data-value="100"><i class="budicon-gift"></i></div>
                                        <h4 class="upper"><span class="number"></span>Finalize Product</h4>
                                        <p>Aenean eu leo quam. Pellentesque ornare lacinia.</p>
                                    </div>
                                </div>
                                <!-- /column -->
                            </div>
                            <!-- /.row -->

                        </div>
                        <!-- /column -->
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->

            </div>
            <!-- /.parallax -->
            <div class="dark-wrapper">
                <div class="container inner">
                    <div class="row">
                        <div class="col-sm-4">
                            <h3>What They Say?</h3>
                            <div class="testimonials">
                                <div class="text-slider cs-hidden">
                                    <div class="item">
                                        <blockquote>
                                            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam id dolor id nibh ultricies vehicula ut id elit. Cum sociis natoque.</p>
                                            <div class="author">
                                                <h5>Connor Gibson</h5>
                                                <div class="meta">Interface Designer</div>
                                            </div>
                                        </blockquote>
                                    </div>
                                    <!-- /.item -->
                                    <div class="item">
                                        <blockquote>
                                            <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia bibendum nulla sed consectetur. Nullam id dolor id nibh. Praesent commodo cursus magna.</p>
                                            <div class="author">
                                                <h5>Sammy Widerski</h5>
                                                <div class="meta">Computer Engineer</div>
                                            </div>
                                        </blockquote>
                                    </div>
                                    <!-- /.item -->
                                    <div class="item">
                                        <blockquote>
                                            <p>Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Aenean lacinia bibendum nulla. </p>
                                            <div class="author">
                                                <h5>Nikolas Brooten</h5>
                                                <div class="meta">Sales Manager</div>
                                            </div>
                                        </blockquote>
                                    </div>
                                    <!-- /.item -->
                                </div>
                                <!-- /.text-slider -->
                            </div>
                            <!-- /.testimonials -->
                        </div>
                        <!-- /column -->

                        <div class="col-sm-4">
                            <h3>Why Choose Us?</h3>
                            <p>Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum. Donec ullamcorper nulla non metus auctor fringilla. Nullam quis risus eget urna mollis ornare vel eu leo.</p>
                            <ul class="unordered-list">
                                <li>Donec ullamcorper nulla non metus auctor.</li>
                                <li>Cras justo odio, dapibus ac facilisis.</li>
                                <li>Praesent commodo cursus magna.</li>
                                <li>Curabitur blandit tempus porttitor.</li>
                            </ul>
                        </div>
                        <!-- /column -->

                        <div class="col-sm-4">
                            <h3>Our Skills</h3>
                            <ul class="progress-list">
                                <li>
                                    <p>Photoshop</p>
                                    <div class="bar" data-value="90"></div>
                                </li>
                                <li>
                                    <p>Final Cut</p>
                                    <div class="bar" data-value="80"></div>
                                </li>
                                <li>
                                    <p>Studio Photography</p>
                                    <div class="bar" data-value="85"></div>
                                </li>
                                <li>
                                    <p>Motion Video</p>
                                    <div class="bar" data-value="65"></div>
                                </li>
                            </ul>
                            <!-- /.progress-list -->
                        </div>
                        <!-- /column -->
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->
            </div>
            <!-- /.dark-wrapper -->

            <div class="light-wrapper">
                <div class="container inner">
                    <div class="row">
                        <div class="col-sm-3">
                            <h3>Meet the Team</h3>
                            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Nulla vitae elit libero, a pharetra augue.</p>
                            <div class="text-carousel-controls">
                                <div class="btn btn-square prev"><i class="fa fa-angle-left"></i></div>
                                <div class="btn btn-square next"><i class="fa fa-angle-right"></i></div>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <div class="text-carousel text-center cs-hidden">
                                <div class="item">
                                    <figure class="mb-20">
                                        <img src="style/images/art/team1.jpg" alt="" />
                                    </figure>
                                    <h5>Nikola Brooten</h5>
                                    <div class="meta">Art Director</div>
                                    <div class="space5"></div>
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                                    <ul class="social">
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                    </ul>
                                </div>
                                <!-- /.item -->
                                <div class="item">
                                    <figure class="mb-20">
                                        <img src="style/images/art/team2.jpg" alt="" />
                                    </figure>
                                    <h5>Elsie Spear</h5>
                                    <div class="meta">Photographer</div>
                                    <div class="space5"></div>
                                    <p>Morbi leo risus, porta ac consectetur ac, vestibulum.</p>
                                    <ul class="social">
                                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                                <!-- /.item -->

                                <div class="item">
                                    <figure class="mb-20">
                                        <img src="style/images/art/team3.jpg" alt="" />
                                    </figure>
                                    <h5>Coriss Ambady</h5>
                                    <div class="meta">Photographer & Editor</div>
                                    <div class="space5"></div>
                                    <p>Nullam id dolor id nibh ultricies vehicula ut id elit vestibulum.</p>
                                    <ul class="social">
                                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                    </ul>
                                </div>
                                <!-- /.item -->
                                <div class="item">
                                    <figure class="mb-20">
                                        <img src="style/images/art/team4.jpg" alt="" />
                                    </figure>
                                    <h5>Katie Blush</h5>
                                    <div class="meta">Editor</div>
                                    <div class="space5"></div>
                                    <p>Maecenas faucibus mollis interdum. Aenean eu leo quam ornare sem.</p>
                                    <ul class="social">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                                <!-- /.item -->
                                <div class="item">
                                    <figure class="mb-20">
                                        <img src="style/images/art/team5.jpg" alt="" />
                                    </figure>
                                    <h5>Mr. Barclay</h5>
                                    <div class="meta">Office Mascot</div>
                                    <div class="space5"></div>
                                    <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                    <ul class="social">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                    </ul>
                                </div>
                                <!-- /.item -->
                            </div>
                            <!-- /.text-carousel -->

                        </div>
                    </div>
                </div>
                <!-- /.container -->
            </div>
            <!-- /.light-wrapper -->
        </section>
        <!-- /#services-->



        <section id="contact">
            <div class="google-map h450" data-lat="51.211215" data-lng="3.226287"></div>
            <div class="light-wrapper">
                <div class="container inner pb-60">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <h2 class="section-title text-center">Get in Touch</h2>
                            <p class="lead text-center">Feel free to drop us a line to contact us</p>
                            <p class="text-center">Nulla vitae elit libero, a pharetra augue. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Sed posuere consectetur est at lobortis.</p>
                            <ul class="contact-info list-inline text-center">
                                <li><i class="budicon-pin"></i>
                                    <p>Moonshine St. 14/05 Light City</p>
                                </li>
                                <li><i class="budicon-profile"></i>
                                    <p><a href="mailto:first.last@email.com" class="nocolor">first.last@email.com</a></p>
                                </li>
                                <li><i class="budicon-telephone"></i>
                                    <p>00 (123) 456 78 90</p>
                                </li>
                            </ul>
                            <div class="space30"></div>
                            <div class="form-container">
                                <form action="contact/vanilla-form.php" method="post" class="vanilla vanilla-form" novalidate>
                                    <div class="row">
                                        <div class="col-sm-6 pr-10">
                                            <div class="form-field">
                                                <label>
                                                    Your name*
                       
                                                    <input type="text" name="name" required="required">
                                                </label>
                                            </div>
                                            <!--/.form-field -->
                                        </div>
                                        <!--/column -->
                                        <div class="col-sm-6 pl-10">
                                            <div class="form-field">
                                                <label>
                                                    Your e-mail*
                       
                                                    <input type="email" name="email" required="required">
                                                </label>
                                            </div>
                                            <!--/.form-field -->
                                        </div>
                                        <!--/column -->
                                        <div class="col-sm-6 pr-10">
                                            <div class="form-field">
                                                <label>
                                                    Subject
                       
                                                    <input type="text" name="subject">
                                                </label>
                                            </div>
                                            <!--/.form-field -->
                                        </div>
                                        <!--/column -->
                                        <div class="col-sm-6 pl-10">
                                            <div class="form-field">
                                                <label>
                                                    Your Phone
                       
                                                    <input type="tel" name="tel">
                                                </label>
                                            </div>
                                            <!--/.form-field -->
                                        </div>
                                        <!--/column -->

                                        <div class="col-sm-12">
                                            <div class="form-field">
                                                <label>
                                                    Your Message*
                       
                                                    <textarea name="message" required></textarea>
                                                </label>
                                                <div class="text-center">
                                                    <input type="submit" class="btn" value="Send Message" data-error="Fix errors" data-processing="Sending..." data-success="Thank you!">
                                                </div>
                                                <footer class="notification-box"></footer>
                                            </div>
                                            <!--/.form-field -->
                                        </div>
                                        <!--/column -->

                                    </div>
                                    <!--/.row -->

                                </form>
                                <!--/.vanilla-form -->
                            </div>
                            <!--/.form-container -->

                        </div>
                        <!--/column -->

                    </div>
                    <!--/.row -->

                </div>
                <!-- /.container -->
            </div>
            <!-- /.light-wrapper -->
        </section>
        <!-- /#contact -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="inverse-wrapper">
        <div class="sub-footer">
            <div class="container inner">
                <div class="cell text-left">
                    <p>© 2017 Effigy. All rights reserved. </p>
                </div>
                <!-- /.cell -->
                <div class="cell text-right">
                    <ul class="social">
                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
                <!-- /.cell -->
            </div>
            <!-- /.sub-footer -->
        </div>
        <!-- /.container -->
    </footer>
    <script type="text/javascript" src="style/js/jquery.min.js"></script>
    <script type="text/javascript" src="style/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="style/revolution/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
    <script type="text/javascript" src="style/revolution/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
    <script type="text/javascript" src="style/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="style/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="style/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="style/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="style/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="style/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="style/js/plugins.js"></script>
    <script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>
