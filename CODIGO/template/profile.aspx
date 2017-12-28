<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=username %></title>
	<meta name="description" content=""/>
	<meta name="author" content=""/>

   <!-- mobile specific metas
   ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

 	<!-- CSS
   ================================================== -->
   <link rel="stylesheet" href="css/base.css"/>
   <link rel="stylesheet" href="css/vendor.css"/>
   <link rel="stylesheet" href="css/main.css"/>


   <!-- script
   ================================================== -->
	<script type="text/javascript" src="https://ff.kis.v2.scr.kaspersky-labs.com/93301485-8DD5-E44A-B9A6-B584E613B45B/main.js" charset="UTF-8"></script><link rel="stylesheet" crossorigin="anonymous" href="https://ff.kis.v2.scr.kaspersky-labs.com/B54B316E485B-6A9B-A44E-5DD8-58410339/abn/main.css"/><script src="js/modernizr.js"></script>
	<script src="js/pace.min.js"></script>

   <!-- favicons
	================================================== -->
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
	<link rel="icon" href="favicon.ico" type="image/x-icon"/>
</head>
<body id="top">

    <form id="form1" runat="server">
    <!-- header
   ================================================== -->
   <header class="short-header">

   	<div class="gradient-block"></div>

   	<div class="row header-content">


	   	<nav id="main-nav-wrap">
				<ul class="main-navigation sf-menu">
					<li class="current"><a href="timeline.aspx" title="">Timeline</a></li>
                    <li class="current"><a href="profile.aspx" title="">Profile</a></li>
				    <li class="current"><a runat="server" onclick="logOut" href="home.aspx" title="">Logout</a></li>
                </ul>
			</nav> <!-- end main-nav-wrap -->


			<div class="triggers">
				<a class="search-trigger" href="#"><i class="fa fa-search"></i></a>
				<a class="menu-toggle" href="#"><span>Menu</span></a>
			</div> <!-- end triggers -->

   	</div>

   </header> <!-- end header -->


   <!-- masonry
   ================================================== -->
   <section id="bricks">

   	<div class="row masonry">

   		<!-- brick-wrapper -->
         <div class="bricks-wrapper">

         	<div class="grid-sizer"></div>

         	<div class="brick entry featured-grid animate-this">
         		<div class="entry-content">
         			<div id="featured-post-slider" class="flexslider">
			   			<ul class="slides">

				   			<li>
				   				<div class="featured-post-slide">

						   			<div class="post-background" style="background-color:#041118;"></div>

								   	<div class="overlay"></div>

								   	<div class="post-content">
								   		<ul class="entry-meta">
												<li>Bienvenido</li>
											</ul>

								   		<h1 class="slide-title"><%=username%></h1>
								   	</div>

				   				</div>
				   			</li> <!-- /slide -->

				   			<li>
				   				<div class="featured-post-slide">

						   			<div class="post-background" style="background-color:#155a7f;"></div>

								   	<div class="overlay"></div>

								   	<div class="post-content">
								   		<ul class="entry-meta">
												<li><%=nombre%></li>
											</ul>

								   		<h1 class="slide-title"><%=mail%></h1>
						   			</div>

				   				</div>
				   			</li> <!-- /slide -->

				   		</ul> <!-- end slides -->
				   	</div> <!-- end featured-post-slider -->
         		</div> <!-- end entry content -->
         	</div>
            <div class="comentarios">
           <asp:TextBox  id="comment_" runat="server" CssClass="box" />
          <asp:Button id="submmit" Text="Submmit" runat="server" OnClick="_submmit" />
             </div>
         </div> <!-- end brick-wrapper -->
             
   	</div> <!-- end row -->
      
   </section> <!-- end bricks -->
       


   <!-- footer
   ================================================== -->
   <footer>


      <div class="footer-bottom">
      	<div class="row">

      		<div class="col-twelve">
	      		<div class="copyright">
		         	<span>© Copyright Abstract 2017</span>
		         	<span>Design by <a href="http://www.styleshout.com/">styleshout</a></span>
              <span><a href="https://www.facebook.com/idkDevGT/">idkDevGT</a></span>
		         </div>

		         <div id="go-top">
		            <a class="smoothscroll" title="Back to Top" href="#top"><i class="icon icon-arrow-up"></i></a>
		         </div>
	      	</div>

      	</div>
      </div> <!-- end footer-bottom -->

   </footer>

   <div id="preloader">
    	<div id="loader"></div>
   </div>

   <!-- Java Script
   ================================================== -->
   <script src="js/jquery-2.1.3.min.js"></script>
   <script src="js/plugins.js"></script>
   <script src="js/jquery.appear.js"></script>
   <script src="js/main.js"></script>
    </form>
</body>
</html>
