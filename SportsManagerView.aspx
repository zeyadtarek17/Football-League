<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SportsManagerView.aspx.cs" Inherits="DatabaseProject.SportsManagerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" Text="Hello Sports Manager" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:Label ID="addm" runat="server" Text="Add New Match" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:Label ID="hc" runat="server" Text="Host Club Name" Font-Bold="true"></asp:Label>
            <br />
            <asp:DropDownList ID="hcn" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            
            <br />
            <asp:Label ID="gc" runat="server" Text="Guest Club Name" Font-Bold="true"></asp:Label>
            <br />
           <asp:DropDownList ID="gcn" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            
            <br />
            <asp:Label ID="stime" runat="server" Text="Start Time" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="st" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br />
            <asp:Label ID="etime" runat="server" Text="End Time" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="et" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="am" runat="server" Text="Add Match" Font-Bold="true" OnClick="am_Click" />
            <br />
            <br />
            <asp:Label ID="dlcl" runat="server" Text="Delete Match" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:Label ID="hcc" runat="server" Text="Host Club Name" Font-Bold="true"></asp:Label>
            <br />
            <asp:DropDownList ID="hcnn" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            
            <br />
            <asp:Label ID="ggc" runat="server" Text="Guest Club Name" Font-Bold="true"></asp:Label>
            <br />
            <asp:DropDownList ID="gnc" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            
            <br />
            <asp:Label ID="sttt" runat="server" Text="Start Time" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="stt" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br />
            <asp:Label ID="ettt" runat="server" Text="End Time" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="ett" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="del" runat="server" Text="Delete Match" Font-Bold="true" OnClick="del_Click" />
            <br />
            <br />
            <asp:Button ID="upm" runat="server" Text="View All Upcoming Matches" Font-Bold="true" OnClick="upm_Click" />
            <br />
            <br />
            <asp:GridView ID="vum" runat="server"></asp:GridView>
            <br />
            <br />
            <asp:Button ID="apl" runat="server" Text="View Already Played Matches" Font-Bold="true" OnClick="apl_Click" />
            <br />
            <br />
            <asp:GridView ID="vpm" runat="server"></asp:GridView>
            <br />
            <br />
            <asp:Button ID="pnp" runat="server" Text="View Clubs Who Never Played Against Each Other" Font-Bold="true" OnClick="pnp_Click" />
            <br />
            <br />
            <asp:GridView ID="nvm" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
