<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companies.aspx.cs"
    Inherits="PlacementDashboard.Companies" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Placement Report</title>
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
    <div class="container">
        <header class="page-header">
            <div>
                <span class="eyebrow">PLACEMENT CELL</span>
                <h1>Company Placement Report</h1>
                <p>Company-wise details of placed students.</p>
            </div>
            <asp:HyperLink ID="lnkDashboard" runat="server"
                NavigateUrl="~/Default.aspx" CssClass="button secondary">
                Back to Dashboard
            </asp:HyperLink>
        </header>

        <section class="panel">
            <h2>Company Details Using DataList</h2>
            <asp:DataList ID="dlPlacements" runat="server" RepeatLayout="Flow">
                <ItemTemplate>
                    <article class="company-card">
                        <div class="company-mark">✓</div>
                        <div>
                            <h3><%# Eval("CompanyName") %></h3>
                            <p><strong>Student ID:</strong> <%# Eval("StudentId") %></p>
                            <p><strong>Job Role:</strong> <%# Eval("JobRole") %></p>
                            <p><strong>Package:</strong>
                                <%# Eval("PackageLPA", "{0:N2}") %> LPA
                            </p>
                        </div>
                    </article>
                </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="lblNoCompanies" runat="server"
                CssClass="empty-message" Visible="false"
                Text="No placed student records found." />
        </section>
        <footer>Placement Dashboard · Practical 9</footer>
    </div>
</form>
</body>
</html>
