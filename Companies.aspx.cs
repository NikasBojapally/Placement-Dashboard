using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace PlacementDashboard
{
    public partial class Companies : Page
    {
        private readonly string cs =
            ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadPlacements();
        }

        private void LoadPlacements()
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT PlacementId, StudentId, CompanyName, JobRole, PackageLPA
                FROM dbo.Students
                WHERE CompanyName IS NOT NULL
                    AND LTRIM(RTRIM(CompanyName)) <> ''
                ORDER BY CompanyName, StudentId;", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                dlPlacements.DataSource = dt;
                dlPlacements.DataBind();
                lblNoCompanies.Visible = dt.Rows.Count == 0;
            }
        }
    }
}
