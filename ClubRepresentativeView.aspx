<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClubRepresentativeView.aspx.cs" Inherits="DatabaseProject.ClubRepresentativeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Label runat="server" Text="Hello Club Representative" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br />
            <br />
            
            <asp:Button ID="infocl" runat="server" Text="View All The Club Information" OnClick="infocl_Click" />
            <br />
            <br />
             <asp:GridView ID="vaci" runat="server"></asp:GridView>
            <br />
            <br />
            <asp:Button ID="clm" runat="server" Text="View All The Upcoming Matches Of The Club" OnClick="clm_Click" />
             <br />
            <br />
            <asp:GridView ID="vaum" runat="server"></asp:GridView>
            <br />
            <br />
            <asp:Button ID="avst" runat="server" Text="View All The Available Stadiums" OnClick="avst_Click" />
             <br />
            <br />
            <asp:GridView ID="vaas" runat="server"></asp:GridView>
            <br />
            <br />
            <asp:Button ID="clrequ" runat="server" Text="Send A Request To A Stadium Manager" OnClick="clrequ_Click" />

            
        </div>
    </form>
</body>
</html>
