<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FanView.aspx.cs" Inherits="DatabaseProject.FanView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" Text="Hello Fan" Font-Size="Larger" Font-Bold="true"></asp:Label>
            <br /><br />
            <asp:TextBox ID="stt" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br /><br />
            <asp:Button ID="mt" runat="server" Text="View All The Matches That Have Available Tickets" Font-Bold="true" OnClick="tickets"/>
            <br/><br/>
            <asp:GridView ID="ticket" runat="server"></asp:GridView>
            <br /><br />
            <asp:Label ID="data" runat="server" Text="Please Enter The Details Required Below"></asp:Label>
            <br /><br />
            <asp:Label ID="Label1" runat="server" Text="Your Fan National Id :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="natId" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="Label2" runat="server" Text="The Host Club:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="hcl" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            
            <br /><br />
            <asp:Label ID="Label3" runat="server" Text="The Guest Club :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="gcl" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PLDB %>" SelectCommand="SELECT [name] FROM [club]"></asp:SqlDataSource>
            
            <br /><br />
            <asp:Label ID="Label4" runat="server" Text="Date, Start Time and End Time :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="dtime" runat="server" TextMode="DateTimeLocal"></asp:TextBox>

            <br /><br />
            <asp:Button ID="pt" runat="server" Text="Purchase A Ticket For A Match" Font-Bold="true" OnClick="pt_Click" />

        </div>
    </form>
</body>
</html>
