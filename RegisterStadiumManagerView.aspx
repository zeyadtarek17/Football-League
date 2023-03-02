<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterStadiumManagerView.aspx.cs" Inherits="DatabaseProject.RegisterStadiumManagerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="wel" runat="server" Text="Create Your Stadium Manager Account !"></asp:Label>
            <br />
            <br />
            <asp:Label ID="name" runat="server" Text="Enter Your Name" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:TextBox ID="n" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="username" runat="server" Text="Enter Your Username" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:TextBox ID="us" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="password" runat="server" Text="Enter Your Password" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:TextBox ID="p" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="stadium" runat="server" Text="Choose The Stadium Name" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
             <asp:DropDownList ID="StadiumList" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [stadium]"></asp:SqlDataSource>
            
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Create" Font-Bold="true" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
