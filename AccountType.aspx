<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountType.aspx.cs" Inherits="DatabaseProject.AccountType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="acc" runat="server" Text="Choose Your Account Type" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <br />
            <asp:Button ID="f" runat="server" Text="Fan" OnClick="f_Click" />
            <br />
            <br />
             <asp:Button ID="c" runat="server" Text="Club Representative" OnClick="c_Click" />
            <br />
            <br />
             <asp:Button ID="sm" runat="server" Text="Sports Manager" OnClick="sm_Click" />
            <br />
            <br />
             <asp:Button ID="st" runat="server" Text="Stadium Manager" OnClick="st_Click" />
            <br />
            <br />

        </div>
    </form>
</body>
</html>
