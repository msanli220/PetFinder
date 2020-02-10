<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PetFinder.Register" Title="PetFinder Register" MetaDescription="Register" MetaKeywords="Pet, Finder, Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Register</title>
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
                        <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                        <li><a href="Register.aspx"><span class="glyphicon glyphicon-floppy-disk"></span>Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron">
            <div class="container text-center">
                <h1 style="font-family: Pristina;">PetFinder</h1>
                <p>Register</p>
            </div>
        </div>

        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-3 left">
                </div>
                <div class="col-sm-6 center">
                    <br />
                    <asp:Label ID="lblRegister" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Register"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblType" runat="server" Text="Type:" Width="15%"></asp:Label>
                    <asp:DropDownList ID="ddlUserTypes" runat="server" Width="30%">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="registerUsTypeChooseValidator" runat="server" ControlToValidate="ddlUserTypes" ErrorMessage="Please choose you type !" InitialValue="Choose..." ValidationGroup="register" ForeColor="Red" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblName" runat="server" Text="Name:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" Width="30%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="registerNameValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Please fill your name !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblSurname" runat="server" Text="Surname:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtSurname" runat="server" Width="30%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="registerSurnameValidator" runat="server" ControlToValidate="txtSurname" ErrorMessage="Please fill your surname !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblMail" runat="server" Text="E-mail:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" Width="30%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="registerEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please fill your e-mail !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblPass" runat="server" Text="Password:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="30%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="registerPassValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please fill your password !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="10" Width="30%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="registerPhoneValidator" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Please fill your phone number !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblAge" runat="server" Text="Age:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtAge" runat="server" MaxLength="2" Width="30%"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="registerAgeValidator" runat="server" ControlToValidate="txtAge" ErrorMessage="Please fill your age !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblGender" runat="server" Text="Gender:" Width="15%"></asp:Label>
                    <asp:DropDownList ID="ddlGender" runat="server" Width="30%">
                        <asp:ListItem>Choose...</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:RequiredFieldValidator ID="registerGenderValidator" runat="server" ControlToValidate="ddlGender" ErrorMessage="Please choose you gender !" InitialValue="Choose..." ValidationGroup="register" ForeColor="Red" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblAddress" runat="server" Text="Address:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" Width="30%"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please fill your address !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblCity" runat="server" Text="City:" Width="15%"></asp:Label>
                    <asp:TextBox ID="txtCity" runat="server" Width="30%"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="registerCityValidator" runat="server" ControlToValidate="txtCity" ErrorMessage="Please fill your city !" ForeColor="Red" ValidationGroup="register" Width="30%"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblPhoto" runat="server" Text="Upload Photo:" Width="15%"></asp:Label>
                    <center><asp:FileUpload ID="fuImage" runat="server" Width="30%" /></center>
                    <br />
                    <br />
                    <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" OnClick="btnRegister_Click" Text="Register" Font-Bold="True" Style="margin-bottom: 0px" ValidationGroup="register" Width="30%" />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="registerPhotoValidator" runat="server" ErrorMessage="Please upload you photo !" ForeColor="Red" ControlToValidate="fuImage" ValidationGroup="register"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="registerInvalidEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid e-mail address !" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="register"></asp:RegularExpressionValidator>
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
