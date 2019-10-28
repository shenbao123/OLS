<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleRentalReservations.aspx.cs" Inherits="LegendRentals.VehicleRentalReservations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblLoggedIn" runat="server" Text="Logged in as"></asp:Label>
&nbsp;
        <asp:Label ID="lblFirstLastName" runat="server" Text="first last name"></asp:Label>
        <asp:GridView ID="gridViewCustResvs" runat="server" Height="29px" AutoGenerateColumns="False" OnRowCommand="CancelReservation">
            <Columns>
                <asp:ButtonField ButtonType="Button" HeaderText="Cancel Reservation" Text="Cancel" />
                <asp:BoundField HeaderText="LicensePlate" DataField="LicensePlate" />
                <asp:BoundField DataField="Model" HeaderText="Model" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="VehicleType" HeaderText="VehicleType" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="errorLabel" runat="server" ForeColor="Red" style="font-weight: 700" Text="No vehicle reserved" Visible="False"></asp:Label>
        <br />
    
        <br />
        <asp:Button ID="reservationPageButton" runat="server" OnClick="reservationPageButton_Click" Text="Vehicle Rental Page" Width="178px" />
    
    &nbsp;<asp:Button ID="btnLogOut" runat="server" OnClick="btnLogOut_Click" Text="Log Out" Width="115px" />
    
    </div>
    </form>
</body>
</html>
