PLACEMENT DASHBOARD - PRACTICAL 9
ASP.NET Web Forms with C# and SQL Server

PROJECT FILES
- Default.aspx / Default.aspx.cs / Default.aspx.designer.cs:
  Dashboard summary and student GridView.
- Companies.aspx / Companies.aspx.cs / Companies.aspx.designer.cs:
  Company report using DataList.
- Content/Site.css:
  Styling for both pages.
- Database/CreatePlacementDB.sql:
  Creates PlacementDB and dbo.Students, then inserts the six sample rows.
- Web.config:
  Database connection string and ASP.NET settings.

HOW TO RUN (VISUAL STUDIO ON WINDOWS)
1. Create an ASP.NET Web Application (.NET Framework) project named PlacementDashboard.
2. Select Web Forms. Use .NET Framework 4.7.2 or a compatible installed version.
3. Copy these files into the matching project folders. Ensure the .aspx.cs and
   designer files are included in the project and their Build Action is Compile.
4. Open SQL Server Object Explorer or SQL Server Management Studio.
5. Run Database/CreatePlacementDB.sql.
6. If your SQL Server instance is not (localdb)\\MSSQLLocalDB, update the
   Data Source value in Web.config.
7. Build the project and run Default.aspx.
8. Click "View Company Report" to open Companies.aspx.

EXPECTED SAMPLE DATA OUTPUT
Total Students: 6
Placed Students: 4
Unplaced Students: 2
Placement Percentage: 66.67%
Highest Package: 4.50 LPA

The sample records and SQL table structure are reconstructed from the queries
and visible output in the supplied PDF. The PDF does not show the original
CreatePlacementDB.sql contents, Site.css source, or Web.config connection
string, so those supporting files are supplied as working examples.
