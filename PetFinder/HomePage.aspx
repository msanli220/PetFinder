<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PetFinder.HomePage" Title="PetFinder HomePage" MetaDescription="HomePage" MetaKeywords="Pet, Finder, HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder HomePage</title>
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
                        <li><a href="Announcements.aspx"><span class="glyphicon glyphicon-list-alt"></span> Go to Announcements Page</a></li>
                        <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li><a href="Register.aspx"><span class="glyphicon glyphicon-floppy-disk"></span> Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron">
            <div class="container text-center">
                <h1 style="font-family: Pristina;">PetFinder</h1>
                <p>Homepage</p>
            </div>
        </div>

        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-8 left">
                    <iframe width="854" height="480" src="https://www.youtube.com/embed/DLqHI36wJEA" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
                    <br />
                    <br />
                    <a href="https://www.youtube.com/user/cankayatv">
                        <asp:Label ID="lblFollow" runat="server" Text="Follow Cankaya University on "></asp:Label></a>
                    <a href="https://www.youtube.com/user/cankayatv">
                        <asp:Image ID="imgCankayaLogo" runat="server" ImageUrl="~/Images/YouTube_logo.png" AlternateText="Youtube" Width="10%" /></a>
                    <br />
                    <br />
                    <asp:HyperLink ID="emailto" runat="server" NavigateUrl="mailto:bugrayilmaz@petfinder.com">Send E-mail to Admin</asp:HyperLink>
                    <br />
                    <br />
                </div>
                <div class="col-sm-4 right">
                    <center><a href="login.aspx" button type="button" class="btn btn-primary btn-block" style="width: 50%;">Login</a></center>
                    <br />
                    <center><a href="register.aspx" button type="button" class="btn btn-success btn-block" style="width: 50%;">Register</a></center>
                    <br />
                    <br />
                    <asp:Label ID="lblWeather" runat="server" Text="Weather Forecast" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblWeatherAnkara" runat="server" Text="Ankara" Font-Italic="True"></asp:Label>
                    <br />
                    <img src="http://www.mgm.gov.tr/sunum/tahmin-show-2.aspx?m=ANKARA&basla=1&bitir=5&rC=111&rZ=fff" style="width: 400px; height: 100px;" alt="ANKARA" />
                    <br />
                    <br />
                    <asp:Label ID="lblWeatherIstanbul" runat="server" Text="İstanbul" Font-Italic="True"></asp:Label>
                    <br />
                    <img src="http://www.mgm.gov.tr/sunum/tahmin-show-2.aspx?m=ISTANBUL&basla=1&bitir=5&rC=111&rZ=fff" style="width: 400px; height: 100px;" alt="ISTANBUL" />
                    <br />
                    <br />
                    <asp:Label ID="lblWeatherIzmir" runat="server" Text="İzmir" Font-Italic="True"></asp:Label>
                    <br />
                    <img src="http://www.mgm.gov.tr/sunum/tahmin-show-2.aspx?m=IZMIR&basla=1&bitir=5&rC=111&rZ=fff" style="width: 400px; height: 100px;" alt="IZMIR" />
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
