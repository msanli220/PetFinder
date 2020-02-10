<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="PetFinder.Announcements" Title="PetFinder Announcements" MetaDescription="Announcements" MetaKeywords="Pet, Finder, Announcements" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Announcements</title>
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

        .centerHeaderText th {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="HomePage.aspx">PETFINDER</a>
                    <asp:Label ID="lblWelcome" runat="server" Text="Welcome" CssClass="navbar-brand"></asp:Label>
                </div>
            </div>
        </nav>

        <div class="jumbotron">
            <div class="col-sm-2">
                <asp:Image ID="imgUser" runat="server" Height="150px" ImageAlign="Left" />&nbsp;
            </div>
            <div class="container text-center">
                <h1 style="font-family: Pristina;">PetFinder</h1>
                <p>Announcements</p>
            </div>
        </div>

        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-12 center">
                    <br />
                    <br />
                    <asp:Label ID="lblAnnouncementsHeaderUsers" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Announcements from Users" Visible="True"></asp:Label>
                    <asp:GridView ID="grdAnnouncementsUser" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HeaderStyle-CssClass="centerHeaderText">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Announcement ID" DataField="ID" Visible="False"></asp:BoundField>
                            <asp:BoundField HeaderText="Date" DataField="date"></asp:BoundField>
                            <asp:ImageField HeaderText="Photo" DataImageUrlField="photo"></asp:ImageField>
                            <asp:BoundField HeaderText="Name" DataField="name"></asp:BoundField>
                            <asp:BoundField HeaderText="Type" DataField="type"></asp:BoundField>
                            <asp:BoundField HeaderText="Class" DataField="petClass"></asp:BoundField>
                            <asp:BoundField HeaderText="Age" DataField="age"></asp:BoundField>
                            <asp:BoundField HeaderText="Gender" DataField="gender"></asp:BoundField>
                            <asp:BoundField HeaderText="Situation" DataField="situation"></asp:BoundField>
                            <asp:BoundField HeaderText="Fee" DataField="fee"></asp:BoundField>
                            <asp:BoundField HeaderText="Text" DataField="text"></asp:BoundField>
                            <asp:BoundField HeaderText="User Name" DataField="userName"></asp:BoundField>
                            <asp:BoundField HeaderText="User Surname" DataField="userSurname"></asp:BoundField>
                            <asp:BoundField HeaderText="User Address" DataField="userAddress"></asp:BoundField>
                            <asp:BoundField HeaderText="User City" DataField="userCity"></asp:BoundField>
                            <asp:BoundField HeaderText="User Mail" DataField="userMail"></asp:BoundField>
                            <asp:BoundField HeaderText="User Phone" DataField="userPhone"></asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:Label ID="lblAnnouncementsHeaderVets" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Announcements from Veterinaries" Visible="True"></asp:Label>
                    <asp:GridView ID="grdAnnouncementsVet" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HeaderStyle-CssClass="centerHeaderText">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Announcement ID" DataField="ID" Visible="False"></asp:BoundField>
                            <asp:BoundField HeaderText="Date" DataField="date"></asp:BoundField>
                            <asp:ImageField HeaderText="Photo" DataImageUrlField="photo"></asp:ImageField>
                            <asp:BoundField HeaderText="Name" DataField="name"></asp:BoundField>
                            <asp:BoundField HeaderText="Type" DataField="type"></asp:BoundField>
                            <asp:BoundField HeaderText="Class" DataField="petClass"></asp:BoundField>
                            <asp:BoundField HeaderText="Age" DataField="age"></asp:BoundField>
                            <asp:BoundField HeaderText="Gender" DataField="gender"></asp:BoundField>
                            <asp:BoundField HeaderText="Situation" DataField="situation"></asp:BoundField>
                            <asp:BoundField HeaderText="Fee" DataField="fee"></asp:BoundField>
                            <asp:BoundField HeaderText="Text" DataField="text"></asp:BoundField>
                            <asp:BoundField HeaderText="Vet Name" DataField="vetName"></asp:BoundField>
                            <asp:BoundField HeaderText="Vet Surname" DataField="vetSurname"></asp:BoundField>
                            <asp:BoundField HeaderText="Vet Address" DataField="vetAddress"></asp:BoundField>
                            <asp:BoundField HeaderText="Vet City" DataField="vetCity"></asp:BoundField>
                            <asp:BoundField HeaderText="Vet Mail" DataField="vetMail"></asp:BoundField>
                            <asp:BoundField HeaderText="Vet Phone" DataField="vetPhone"></asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
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
