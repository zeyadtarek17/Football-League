<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StadiumManagerView.aspx.cs" Inherits="DatabaseProject.StadiumManagerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Label runat="server" Text="Hello Stadium Manager" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:Button ID="st" runat="server" Text="View Information Of The Stadium" Font-Bold="true" OnClick="st_Click" />
             <br />
            <br />
            <asp:GridView ID="vis" runat="server"></asp:GridView>
             <br />
            <br />
            <asp:Button ID="req" runat="server" Text="View All Match Hosting Requests" Font-Bold="true" OnClick="req_Click" />
            <br />
            <br />
            <asp:GridView ID="vhmr" runat="server"></asp:GridView>
             <br />
            <br />
            <asp:Button ID="ac" runat="server" Text="Accept A Host Request" Font-Bold="true" OnClick="ac_Click" />
            <br />
            <br />
            <asp:Button ID="re" runat="server" Text="Reject A Host Request" Font-Bold="true" OnClick="re_Click" />
        </div>
    </form>
</body>
</html>
