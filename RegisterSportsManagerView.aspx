<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterSportsManagerView.aspx.cs" Inherits="DatabaseProject.RegisterSportsManagerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="welc" runat="server" Text="Create Your Sports Association Manager Account" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <br />
            <asp:Label ID="name" runat="server" Text="Enter Your Name" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="n" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="username" runat="server" Text="Enter Your Username" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="us" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="password" runat="server" Text="Enter Your Password" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="p" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="reg" runat="server" Text="Create !" OnClick="reg_Click"  Font-Bold="true"/>


        </div>
    </form>
</body>
</html>
