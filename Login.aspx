 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="DatabaseProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    
<body>

    
    <form id="form1" runat="server">

        <div>
             <asp:Label runat="server" Text="Hello! Please Login" Font-Size="Larger" Font-Bold="true"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="UsLabel" runat="server" Text="Enter Your Username ! " Font-Bold="true" ></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="username" runat="server" BorderStyle="Solid" BorderWidth="1px" ></asp:TextBox>
     <br />
     <br />
    <asp:Label ID="PassLabel" runat="server" Text="Enter Your Password ! " Font-Bold="true"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="Password" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Loginnn" runat="server" OnClick="Loginn"  Text="Login" Font-Bold="true"></asp:Button>
    <br />
    <br />
            <asp:Button ID="reg" runat="server" Text="Don't Have An Account? Register !"  Font-Bold="true" OnClick="acctype" />       
    <br />
    <br />
    
    

        </div>
    </form>
   
</body></html>
