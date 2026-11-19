using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace PlacementDashboard
{
    public partial class Default : Page
    {
        private readonly string cs =
            ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummary();
                LoadPlacements();
            }
        }

        private void LoadSummary()
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(@"
                SELECT
                    COUNT(*) AS TotalStudents,
                    SUM(CASE WHEN CompanyName IS NOT NULL
                        AND LTRIM(RTRIM(CompanyName)) <> ''
                        THEN 1 ELSE 0 END) AS PlacedStudents,
                    MAX(PackageLPA) AS HighestPackage
                FROM dbo.Students;", con))
            {
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        int total = Convert.ToInt32(reader["TotalStudents"]);
                        int placed = reader["PlacedStudents"] == DBNull.Value
                            ? 0 : Convert.ToInt32(reader["PlacedStudents"]);
                        decimal highest = reader["HighestPackage"] == DBNull.Value
                            ? 0m : Convert.ToDecimal(reader["HighestPackage"]);

                        int unplaced = total - placed;
                        decimal percentage = total == 0
                            ? 0m : (decimal)placed * 100m / total;

                        lblTotal.Text = total.ToString();
                        lblPlaced.Text = placed.ToString();
                        lblUnplaced.Text = unplaced.ToString();
                        lblPercentage.Text = percentage.ToString("N2") + "%";
                        lblHighestPackage.Text = highest.ToString("N2");
                    }
                }
            }
        }

        private void LoadPlacements()
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlDataAdapter da = new SqlDataAdapter(
                @"SELECT PlacementId, StudentId, CompanyName, JobRole, PackageLPA
                  FROM dbo.Students ORDER BY PlacementId;", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvPlacements.DataSource = dt;
                gvPlacements.DataBind();
            }
        }
    }
}
