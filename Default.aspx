<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="PlacementDashboard.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Placement Dashboard</title>
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
    <div class="container">
        <header class="page-header">
            <div>
                <span class="eyebrow">PLACEMENT CELL</span>
                <h1>Placement Dashboard</h1>
                <p>Track student placement performance and company offers.</p>
            </div>
            <asp:HyperLink ID="lnkCompanies" runat="server"
                NavigateUrl="~/Companies.aspx" CssClass="button">
                View Company Report
            </asp:HyperLink>
        </header>

        <h2>Placement Summary</h2>
        <div class="summary-grid">
            <div class="summary-card">
                <span>Total Students</span>
                <strong><asp:Label ID="lblTotal" runat="server" Text="0" /></strong>
            </div>
            <div class="summary-card success">
                <span>Placed Students</span>
                <strong><asp:Label ID="lblPlaced" runat="server" Text="0" /></strong>
            </div>
            <div class="summary-card warning">
                <span>Unplaced Students</span>
                <strong><asp:Label ID="lblUnplaced" runat="server" Text="0" /></strong>
            </div>
            <div class="summary-card">
                <span>Placement Percentage</span>
                <strong><asp:Label ID="lblPercentage" runat="server" Text="0%" /></strong>
            </div>
            <div class="summary-card highlight">
                <span>Highest Package (LPA)</span>
                <strong><asp:Label ID="lblHighestPackage" runat="server" Text="0.00" /></strong>
            </div>
        </div>

        <section class="panel">
            <div class="section-heading">
                <div>
                    <h2>Student Placement Records</h2>
                    <p>All students registered with the placement cell.</p>
                </div>
            </div>
            <div class="table-wrap">
                <asp:GridView ID="gvPlacements" runat="server"
                    AutoGenerateColumns="False" CssClass="data-table"
                    GridLines="None" EmptyDataText="No student records found."
                    DataKeyNames="PlacementId">
                    <Columns>
                        <asp:BoundField DataField="PlacementId" HeaderText="Placement ID" />
                        <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                        <asp:BoundField DataField="JobRole" HeaderText="Job Role" />
                        <asp:BoundField DataField="PackageLPA" HeaderText="Package (LPA)"
                            DataFormatString="{0:N2}" />
                    </Columns>
                    <EmptyDataRowStyle CssClass="empty-row" />
                </asp:GridView>
            </div>
        </section>
        <footer>Placement Dashboard · Practical 9</footer>
    </div>
</form>
</body>
</html>
