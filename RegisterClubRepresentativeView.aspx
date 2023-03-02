<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterClubRepresentativeView.aspx.cs" Inherits="DatabaseProject.RegisterClubRepresentativeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="wel" runat="server" Text="Create Your Club Representative Account !" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:Label ID="n" runat="server" Text="Enter Your Name " Font-Bold="true"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name"  runat ="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="username" runat="server" Text="Enter Your Username " Font-Bold="true"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="us" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="p" runat="server" Text="Enter Your Password " Font-Bold="true"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="club" runat="server" Text="Choose Your Club " Font-Bold="true"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ClubList" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="cr" runat="server" Text="Create !" Font-Bold="true" OnClick="create" />

        </div>
    </form>
</body>
</html>
