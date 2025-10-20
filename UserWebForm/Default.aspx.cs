using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace UserWebForm
{
    public partial class _Default : Page
    {
        UserBLL BLL = new UserBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            try
            {
                // Get all employees
                DataTable dt = BLL.GetUsersBLL();

                // Total Employees
                LblTotalEmployees.Text = dt.Rows.Count.ToString();

                // Active Today (simulate - showing total for now)
                LblActiveToday.Text = dt.Rows.Count.ToString();

                // New This Month (simulate)
                LblNewThisMonth.Text = "0";

                // Load recent employees (top 5)
                if (dt.Rows.Count > 0)
                {
                    DataView dv = dt.DefaultView;
                    dv.Sort = "Id DESC";
                    DataTable dtRecent = dv.ToTable();
                    
                    // Get top 5
                    if (dtRecent.Rows.Count > 5)
                    {
                        dtRecent = dtRecent.AsEnumerable().Take(5).CopyToDataTable();
                    }

                    GvRecentEmployees.DataSource = dtRecent;
                    GvRecentEmployees.DataBind();
                }
                else
                {
                    GvRecentEmployees.DataSource = null;
                    GvRecentEmployees.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Log error
                System.Diagnostics.Debug.WriteLine("Dashboard Error: " + ex.Message);
            }
        }
    }
}