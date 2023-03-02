<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SystemAdminView.aspx.cs" Inherits="DatabaseProject.SystemAdminView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" Text="Hello System Admin" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="newcl" runat="server" Text="Add New Club" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:Label ID="cln" runat="server" Text="Club Name" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="acl" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <asp:Label ID="clloc" runat="server" Text="Club Location" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="loccl" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="addcl" runat="server" Text="Add Club" Font-Bold="true" OnClick="addClub"/>
            <br />
            <br />
            <asp:Label ID="delcl" runat="server" Text="Delete Club" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:Label ID="delc" runat="server" Text="Club Name" Font-Bold="true"></asp:Label>
            <br />
            <asp:DropDownList ID="ClubList" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            
            <br />
            <br />
            <asp:Button ID="deletecl" runat="server" Text="Delete Club" Font-Bold="true" OnClick="deletecl_Click" />
             <br />
            <br />
            <asp:Label ID="newst" runat="server" Text="Add New Stadium" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:Label ID="stn" runat="server" Text="Stadium Name" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="stname" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <asp:Label ID="stloc" runat="server" Text="Stadium Location" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="stlo" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <asp:Label ID="stc" runat="server" Text="Stadium Capacity" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="stcap" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="addst" runat="server" Text="Add Stadium" Font-Bold="true" OnClick="addst_Click"/>
            <br />
            <br />
             <asp:Label ID="delst" runat="server" Text="Delete Stadium" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:Label ID="delsta" runat="server" Text="Stadium Name" Font-Bold="true"></asp:Label>
            <br />
             <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [stadium]"></asp:SqlDataSource>
            
            <br />
            <br />
            <asp:Button ID="deletest" runat="server" Text="Delete Stadium" Font-Bold="true" OnClick="deletest_Click"/>
            <br />
            <br />
             <asp:Label ID="delf" runat="server" Text="Block Fan" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:Label ID="dlf" runat="server" Text="Fan National ID" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="dlfa" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="blockf" runat="server" Text="Block Fan" Font-Bold="true" OnClick="blockf_Click"/>
        </div>
    </form>
</body>
</html>

