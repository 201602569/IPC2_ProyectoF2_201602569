<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Register</title>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'/>

	<link rel="stylesheet" href="css/animate.css"/>
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css"/>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
		<div class="top">
			<h1 id="title" class="hidden"> C O N E C T </h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Register</h2>
			</div>
			<label for="name">Nombres</label>
			<br/>
			<asp:TextBox  id="Name" runat="server" required/>
			<br/>
			<label for="last">Apellidos</label>
			<br/>
			<asp:TextBox  id="lastName" runat="server" required/>
			<br/>
            <label for="mail">E-Mail</label>
			<br/>
			<asp:TextBox  id="eMail" runat="server" required/>
			<br/>
            <label for="date">Fecha</label>
			<br/>
			<asp:TextBox  id="bDate" runat="server" required/>
			<br/>
            <label for="usr">User Name</label>
			<br/>
			<asp:TextBox  id="userName" runat="server" required/>
			<br/>
            <label for="pass">Password</label>
			<br/>
			<asp:TextBox  TextMode="Password" id="psswd" runat="server" required/>
			<br/>
			<asp:Button id="reg" runat="server" OnClick="_register" text="Register"/>
			<br/>
		</div>
	</div>
    </form>
<script>
    $(document).ready(function () {
        $('#logo').addClass('animated fadeInDown');
        $("input:text:visible:first").focus();
    });
    $('#username').focus(function() {
	    $('label[for="username"]').addClass('selected');
    });
    $('#username').blur(function() {
	    $('label[for="username"]').removeClass('selected');
    });
    $('#password').focus(function() {
	    $('label[for="password"]').addClass('selected');
    });
    $('#password').blur(function() {
	    $('label[for="password"]').removeClass('selected');
    });
</script>

</body>
</html>
