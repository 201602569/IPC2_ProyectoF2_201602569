<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Chat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/chatstyle.css"/>
    <!-- Font Awesome File -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
       
        

         <div class="container app">
        <div class="row app-one">

          <div class="col-sm-4 side">
            <div class="side-one">
             
             <form id="form1" runat="server">
              <!-- SearchBox -->
              <div class="row searchBox">
                <div class="col-sm-12 searchBox-inner">
                  <div class="form-group has-feedback">
                    <asp:TextBox type="text" CssClass="form-control" placeholder="search" id="searchText" runat="server"/>
                    <!--<input id="searchText" type="text" class="form-control" name="searchText" placeholder="Search">-->
                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                  </div>
                </div>
              </div>
              <!-- Search Box End -->

              <!-- sideBar -->
              <div class="row sideBar">
                <div runat="server" id="contactos" style="overflow-y: auto; height: 560px">

                </div>
              </div>
              <!-- Sidebar End -->
            </div>
            <div class="side-two">

              <!-- Heading -->
              <div class="row newMessage-heading">
                <div class="row newMessage-main">
                  <div class="col-sm-2 col-xs-2 newMessage-back">
                    <i class="fa fa-arrow-left" aria-hidden="true"></i>
                  </div>
                  <div class="col-sm-10 col-xs-10 newMessage-title">
                    New Chat
                  </div>
                </div>
              </div>
              <!-- Heading End -->

              <!-- ComposeBox -->
              <div class="row composeBox">
                <div class="col-sm-12 composeBox-inner">
                  <div class="form-group has-feedback">
                    <input id="composeText" type="text" class="form-control" name="searchText" placeholder="Search People">
                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                  </div>
                </div>
              </div>
              <!-- ComposeBox End -->

              <!-- sideBar -->
  
            </div>
            <!-- Sidebar End -->
          </div>


          <!-- New Message Sidebar End -->

          <!-- Conversation Start -->
          <div class="col-sm-8 conversation">
            <!-- Heading -->
            <div class="row heading">
              <asp:Label ID="currentChat" ForeColor="white" Font-Size="15" runat="server"></asp:Label>
              <div class="col-sm-1 col-xs-1  heading-dot pull-right">
                <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
              </div>
            </div>
            <!-- Heading End -->

            <!-- Message Box -->
            <div class="row message" id="conversation">

              <div class="row message-previous">
                <div class="col-sm-12 previous">
                  <a onclick="previous(this)" id="ankitjain28" name="20">
                  Show Previous Message!
                  </a>
                </div>
              </div>

            <div runat="server" id="messagesBox">


            </div>
           
                
            </div>
            <!-- Message Box End -->
       
            <!-- Reply Box -->
            <div class="row reply">
           
              <div class="col-sm-11 col-xs-11 reply-main">
                <asp:TextBox  class="form-control" rows="1" id="comment" runat="server"/>
                <!--<textarea class="form-control" rows="1" id="comment"></textarea>-->
              </div>
             
              <div class="col-sm-1 col-xs-1 reply-send">
                <i class="fa fa-send fa-2x" aria-hidden="true"></i>
              </div>
            </div>
                   </form>
            <!-- Reply Box End -->
          </div>
          <!-- Conversation End -->
        </div>
        <!-- App One End -->
      </div>

      <!-- App End -->

</body>
</html>
