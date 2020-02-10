<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PetFinder.Login" Title="PetFinder Login" MetaDescription="Login" MetaKeywords="Pet, Finder, Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {
            height: 450px;
        }

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }

            .row.content {
                height: auto;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="HomePage.aspx">PETFINDER</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li><a href="Register.aspx"><span class="glyphicon glyphicon-floppy-disk"></span> Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron">
            <div class="container text-center">
                <h1 style="font-family: Pristina;">PetFinder</h1>
                <p>Login</p>
            </div>
        </div>

        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-3 left">
                </div>
                <div class="col-sm-6 center">
                    <br />
                    <asp:Label ID="lblLogin" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Login"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblMail" runat="server" Text="E-mail:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" Width="30%"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="loginEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please fill your e-mail !" ForeColor="Red" ValidationGroup="login"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="loginInvalidEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid e-mail address !" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="login"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblPass" runat="server" Text="Password:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="30%"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="loginPasswordValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please fill your password !" ForeColor="Red" ValidationGroup="login"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" OnClick="btnLogin_Click" Text="Login" Font-Bold="True" ValidationGroup="login" Width="30%" />
                    <br />
                    <asp:CheckBox ID="cbRememberMe" runat="server" Text="Remember Me" />
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
                    <br />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />
                </div>
                <div class="col-sm-3 right">
                </div>
            </div>
        </div>

        <footer class="container-fluid text-center">
            <asp:Image ID="imgFooterLogo" runat="server" ImageUrl="~/Images/footerlogo_en.png" />
            <p>PetFinder - All Rights Reserved 2019</p>
        </footer>
    </form>
</body>
</html>