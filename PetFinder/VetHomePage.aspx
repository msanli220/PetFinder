<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VetHomePage.aspx.cs" Inherits="PetFinder.VetHomePage" Title="PetFinder Veterinary HomePage" MetaDescription="Veterinary HomePage" MetaKeywords="Pet, Finder, Veterinary, HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Veterinary HomePage</title>
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
                    <asp:Label ID="lblHeaderName" runat="server" Text="Name" CssClass="navbar-brand"></asp:Label>
                    <asp:Label ID="lblVetTag" runat="server" Text="(Veterinary)" CssClass="navbar-brand"></asp:Label>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="VetHomePage.aspx"><span class="glyphicon glyphicon-queen"></span> Veterinary Homepage</a></li>
                        <li><a href="Announcements.aspx"><span class="glyphicon glyphicon-list-alt"></span> Go to Announcements Page</a></li>
                        <li><a href="CreateAnnouncement.aspx"><span class="glyphicon glyphicon-plus"></span> Create an Announcement</a></li>
                        <li><a href="VetUpdate.aspx"><span class="glyphicon glyphicon-info-sign"></span> Update My Informations</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron">
            <div class="col-sm-2">
                <asp:Image ID="imgVet" runat="server" Height="150px" ImageAlign="Left" />&nbsp;
            </div>
            <div class="container text-center">
                <h1 style="font-family: Pristina;">PetFinder</h1>
                <p>Veterinary Homepage</p>
            </div>
        </div>

        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-12 center">
                    <br />
                    <br />
                    <asp:Button ID="btnAnnouncementsPage" runat="server" CssClass="btn btn-success" Text="Go to Announcements Page" PostBackUrl="~/Announcements.aspx" Width="41%" />
                    <br />
                    <br />
                    <asp:Button ID="btnCreateAnnouncement" runat="server" CssClass="btn btn-primary" Text="Create a Announcement" PostBackUrl="~/CreateAnnouncement.aspx" Width="41%" />
                    <br />
                    <br />
                    <asp:Button ID="btnEnterNewPetData" runat="server" CssClass="btn btn-success" Text="Enter New Pet Data" PostBackUrl="~/EnterPetData.aspx" Width="41%" />
                    <br />
                    <br />
                    <asp:Button ID="btnMyAnnouncements" runat="server" CssClass="btn btn-primary" Text="List Announcements" OnClick="btnMyAnnouncements_Click" Width="20%" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnMyPets" runat="server" CssClass="btn btn-primary" Text="List Pets" OnClick="btnMyPets_Click" Width="20%" />
                    <br />
                    <br />
                    <asp:Label ID="lblAnnouncementsHeader" runat="server" Font-Bold="True" Font-Size="X-Large" Text="My Announcements" Visible="False"></asp:Label>
                    <asp:GridView ID="grdAnnouncements" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HeaderStyle-CssClass="centerHeaderText">
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
                            <asp:BoundField HeaderText="Veterinary Name" DataField="vetName"></asp:BoundField>
                            <asp:BoundField HeaderText="Veterinary Surname" DataField="vetSurname"></asp:BoundField>
                            <asp:BoundField HeaderText="Veterinary Address" DataField="vetAddress"></asp:BoundField>
                            <asp:BoundField HeaderText="Veterinary Mail" DataField="vetMail"></asp:BoundField>
                            <asp:BoundField HeaderText="Veterinary Phone" DataField="vetPhone"></asp:BoundField>
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

                    <asp:Label ID="lblPetsHeader" runat="server" Font-Bold="True" Font-Size="X-Large" Text="My Pets" Visible="False"></asp:Label>

                    <asp:GridView ID="grdPets" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HeaderStyle-CssClass="centerHeaderText">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Pet ID" DataField="ID" Visible="False"></asp:BoundField>
                            <asp:ImageField HeaderText="Photo" DataImageUrlField="photo"></asp:ImageField>
                            <asp:BoundField HeaderText="Name" DataField="name"></asp:BoundField>
                            <asp:BoundField HeaderText="Type" DataField="type"></asp:BoundField>
                            <asp:BoundField HeaderText="Class" DataField="petClass"></asp:BoundField>
                            <asp:BoundField HeaderText="Age" DataField="age"></asp:BoundField>
                            <asp:BoundField HeaderText="Gender" DataField="gender"></asp:BoundField>
                            <asp:BoundField HeaderText="Address" DataField="address"></asp:BoundField>
                            <asp:BoundField HeaderText="City" DataField="city"></asp:BoundField>
                            <asp:BoundField HeaderText="Veterinary Name" DataField="vetName"></asp:BoundField>
                            <asp:BoundField HeaderText="Veterinary Surname" DataField="vetSurname"></asp:BoundField>
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
