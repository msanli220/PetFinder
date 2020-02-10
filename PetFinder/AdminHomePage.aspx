<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="PetFinder.AdminHomePage" Title="PetFinder Admin HomePage" MetaDescription="Admin HomePage" MetaKeywords="Pet, Finder, Admin, HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Admin HomePage</title>
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
                    <asp:Label ID="lblAdmin" runat="server" Text="(Admin)" CssClass="navbar-brand"></asp:Label>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="AdminHomePage.aspx"><span class="glyphicon glyphicon-briefcase"></span> Admin Homepage</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron">
            <div class="col-sm-2">
                <asp:Image ID="imgAdmin" runat="server" Height="150px" ImageAlign="Left" />&nbsp;
            </div>
            <div class="container text-center">
                <h1 style="font-family: Pristina;">PetFinder</h1>
                <p>Administrator Homepage</p>
            </div>
        </div>

        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-12 center">
                    <br />
                    <br />
                    <asp:Button ID="bntListUsers" runat="server" CssClass="btn btn-primary" Text="List Users" OnClick="bntListUsers_Click" Width="20%" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnAppUsers" runat="server" CssClass="btn btn-primary" OnClick="btnAppUsers_Click" Text="Approve Users" Width="20%" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnListVets" runat="server" CssClass="btn btn-info" Text="List Vets" OnClick="btnListVets_Click" Width="20%" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnAppVets" runat="server" CssClass="btn btn-info" OnClick="btnAppVets_Click" Text="Approve Vets" Width="20%" />
                    <br />
                    <br />
                    <asp:Label ID="lblUsersHeader" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Users" Visible="False"></asp:Label>

                    <asp:GridView ID="grdUser" runat="server" AutoGenerateColumns="False" OnRowDeleting="grdUser_RowDeleting" OnRowCancelingEdit="grdUser_RowCancelingEdit" OnRowEditing="grdUser_RowEditing" OnRowUpdating="grdUser_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HeaderStyle-CssClass="centerHeaderText">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:TemplateField HeaderText="User ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" runat="server" Text='<%# Bind("userID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:ImageField DataImageUrlField="photoURL" HeaderText="Photo"></asp:ImageField>

                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("name")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="txtUserName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Surname">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUserSurname" runat="server" Text='<%# Bind("surname")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblUserSurname" runat="server" Text='<%# Bind("surname") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMailAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("emailAddress")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("emailAddress") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Password">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("password")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PhoneNumber">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("phoneNumber")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Age">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("age")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAge" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("gender")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblGender" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo URL">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPhoto" runat="server" Text='<%# Bind("photoURL")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPhoto" runat="server" Text='<%# Bind("photoURL") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("address")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="City">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Approve">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="checkApproval" runat="server" Checked='<%# Bind("approvalSituation")%>'></asp:CheckBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblApproval" runat="server" Text='<%# Bind("approvalSituation") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:CommandField DeleteText="Delete" EditText="Edit" HeaderText="Operations" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
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


                    <asp:Label ID="lblAppUsersHeader" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Waiting List for New Costumers" Visible="False"></asp:Label>


                    <asp:GridView ID="grdAppUser" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="grdAppUser_SelectedIndexChanged" Width="100%" HeaderStyle-CssClass="centerHeaderText">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="User ID" DataField="userID"></asp:BoundField>
                            <asp:ImageField HeaderText="Photo" DataImageUrlField="photoURL"></asp:ImageField>
                            <asp:BoundField HeaderText="Name" DataField="name"></asp:BoundField>
                            <asp:BoundField HeaderText="Surname" DataField="surname"></asp:BoundField>
                            <asp:BoundField HeaderText="EMailAddress" DataField="emailAddress"></asp:BoundField>
                            <asp:BoundField HeaderText="Password" DataField="password"></asp:BoundField>
                            <asp:BoundField HeaderText="PhoneNumber" DataField="phoneNumber"></asp:BoundField>
                            <asp:BoundField HeaderText="Age" DataField="age"></asp:BoundField>
                            <asp:BoundField HeaderText="Gender" DataField="gender"></asp:BoundField>
                            <asp:BoundField HeaderText="Photo URL" DataField="photoURL"></asp:BoundField>
                            <asp:BoundField HeaderText="Address" DataField="address"></asp:BoundField>
                            <asp:BoundField HeaderText="City" DataField="city"></asp:BoundField>
                            <asp:CommandField ShowSelectButton="True" HeaderText="Approve" SelectText="Approve" />
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


                    <asp:Label ID="lblVetsHeader" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Vets" Visible="False"></asp:Label>


                    <asp:GridView ID="grdVet" runat="server" AutoGenerateColumns="False" OnRowDeleting="grdVet_RowDeleting" OnRowCancelingEdit="grdVet_RowCancelingEdit" OnRowEditing="grdVet_RowEditing" OnRowUpdating="grdVet_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HeaderStyle-CssClass="centerHeaderText">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:TemplateField HeaderText="Vet ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblVetID" runat="server" Text='<%# Bind("vetID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:ImageField DataImageUrlField="photoURL" HeaderText="Photo"></asp:ImageField>

                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtVetName" runat="server" Text='<%# Bind("name")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="txtVetName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Surname">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtVetSurname" runat="server" Text='<%# Bind("surname")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblVetSurname" runat="server" Text='<%# Bind("surname") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMailAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("emailAddress")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("emailAddress") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Password">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("password")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PhoneNumber">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("phoneNumber")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Age">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("age")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAge" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("gender")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblGender" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo URL">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPhoto" runat="server" Text='<%# Bind("photoURL")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPhoto" runat="server" Text='<%# Bind("photoURL") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("address")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="City">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Approve">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="checkApproval" runat="server" Checked='<%# Bind("approvalSituation")%>'></asp:CheckBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblApproval" runat="server" Text='<%# Bind("approvalSituation") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>

                            <asp:CommandField DeleteText="Delete" EditText="Edit" HeaderText="Operations" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
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


                    <asp:Label ID="lblAppVetsHeader" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Waiting List for New Vets" Visible="False"></asp:Label>


                    <asp:GridView ID="grdAppVet" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="grdAppVet_SelectedIndexChanged" Width="100%" HeaderStyle-CssClass="centerHeaderText">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Vet ID" DataField="VetID"></asp:BoundField>
                            <asp:ImageField HeaderText="Photo" DataImageUrlField="photoURL"></asp:ImageField>
                            <asp:BoundField HeaderText="Name" DataField="name"></asp:BoundField>
                            <asp:BoundField HeaderText="Surname" DataField="surname"></asp:BoundField>
                            <asp:BoundField HeaderText="EMailAddress" DataField="emailAddress"></asp:BoundField>
                            <asp:BoundField HeaderText="Password" DataField="password"></asp:BoundField>
                            <asp:BoundField HeaderText="PhoneNumber" DataField="phoneNumber"></asp:BoundField>
                            <asp:BoundField HeaderText="Age" DataField="age"></asp:BoundField>
                            <asp:BoundField HeaderText="Gender" DataField="gender"></asp:BoundField>
                            <asp:BoundField HeaderText="Photo URL" DataField="photoURL"></asp:BoundField>
                            <asp:BoundField HeaderText="Address" DataField="address"></asp:BoundField>
                            <asp:BoundField HeaderText="City" DataField="city"></asp:BoundField>
                            <asp:CommandField ShowSelectButton="True" HeaderText="Approve" SelectText="Approve" />
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
