<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RentalVehiclePage.aspx.cs" Inherits="LegendRentals.RentalVehiclePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Logged in as
        <asp:Label ID="customerIdLabel" runat="server"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="vehicleTypeDropDownList" runat="server" AppendDataBoundItems="True">
            <asp:ListItem Value="0">(All Types)</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Vehicle Model:
        <asp:TextBox ID="availableVehicleTextBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search" />
        &nbsp;&nbsp;
        <asp:Button ID="reservationButton" runat="server" OnClick="reservationButton_Click" Text="My Reservation" />
        <br />
        <br />
        &nbsp;<br />
        <asp:Label ID="errorLabel" runat="server" ForeColor="Red" style="font-weight: 700" Text="Unexpected error occurred" Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="availableVehicleGridView" runat="server" OnRowCommand="availableVehicleGridViewRowCommand" AutoGenerateColumns="False">
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="RESERVE" Text="Reserve" />
                <asp:BoundField DataField="LicensePlate" HeaderText="LicensePlate" />
                <asp:BoundField DataField="Model" HeaderText="Model" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="VehicleType" HeaderText="VehicleType" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="noVehicleLabel" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="There are no available vehicles" Visible="False"></asp:Label>
    </form>
</body>
</html>
