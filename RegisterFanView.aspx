<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterFanView.aspx.cs" Inherits="DatabaseProject.RegisterFanView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="wel" runat="server" Text="Create Your Fan Account" Font-Bold="true" Font-Size="Larger"></asp:Label>
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
            <asp:Label ID="ID" runat="server" Text="Enter Your National Id Number" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="i" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="phone" runat="server" Text="Enter Your Phone Number" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="po" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="birthdate" runat="server" Text="Enter Your Birthdate" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="address" runat="server" Text="Enter Your Address" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="a" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="create" runat="server" Text="Create !" OnClick="create_Click" Font-Bold="true" />

        </div>
    </form>
</body>
</html>
