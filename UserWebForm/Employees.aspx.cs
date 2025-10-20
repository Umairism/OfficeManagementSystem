using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppProps;
using BusinessLogicLayer;

namespace UserWebForm
{
    public partial class Employees : System.Web.UI.Page
    {
        UserBLL BLL = new UserBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(TxtName.Text) || string.IsNullOrWhiteSpace(TxtEmail.Text) || string.IsNullOrWhiteSpace(TxtAddress.Text))
                {
                    ShowMessage("Please fill all required fields", "warning");
                    return;
                }

                User U = new User()
                {
                    Name = TxtName.Text.Trim(),
                    Email = TxtEmail.Text.Trim(),
                    Address = TxtAddress.Text.Trim()
                };

                if (BLL.InsertUserBLL(U))
                {
                    LoadData();
                    ClearFields();
                    ShowMessage("Employee saved successfully!", "success");
                }
                else
                {
                    ShowMessage("Error: Unable to save employee data", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "danger");
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DDLEmployees.SelectedValue))
                {
                    ShowMessage("Please select an employee to update", "warning");
                    return;
                }

                if (string.IsNullOrWhiteSpace(TxtName.Text) || string.IsNullOrWhiteSpace(TxtEmail.Text) || string.IsNullOrWhiteSpace(TxtAddress.Text))
                {
                    ShowMessage("Please fill all required fields", "warning");
                    return;
                }

                User U = new User()
                {
                    Id = int.Parse(DDLEmployees.SelectedValue),
                    Name = TxtName.Text.Trim(),
                    Email = TxtEmail.Text.Trim(),
                    Address = TxtAddress.Text.Trim()
                };

                if (BLL.UpdateUserBLL(U))
                {
                    LoadData();
                    ClearFields();
                    ShowMessage("Employee updated successfully!", "success");
                }
                else
                {
                    ShowMessage("Error: Unable to update employee data", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "danger");
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DDLEmployees.SelectedValue))
                {
                    ShowMessage("Please select an employee to delete", "warning");
                    return;
                }

                User U = new User()
                {
                    Id = int.Parse(DDLEmployees.SelectedValue)
                };

                if (BLL.DeleteUserBLL(U))
                {
                    LoadData();
                    ClearFields();
                    ShowMessage("Employee deleted successfully!", "success");
                }
                else
                {
                    ShowMessage("Error: Unable to delete employee", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "danger");
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DDLEmployees.SelectedValue))
                {
                    ShowMessage("Please select an employee to search", "warning");
                    return;
                }

                User U = new User()
                {
                    Id = int.Parse(DDLEmployees.SelectedValue)
                };

                DataTable dt = BLL.UserSearchBLL(U);

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    TxtName.Text = row["Name"].ToString();
                    TxtEmail.Text = row["Email"].ToString();
                    TxtAddress.Text = row["Address"].ToString();
                    ShowMessage("Employee found and loaded for editing", "info");
                }
                else
                {
                    ShowMessage("Employee not found", "warning");
                    TxtName.Text = "";
                    TxtEmail.Text = "";
                    TxtAddress.Text = "";
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "danger");
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
            ShowMessage("Form cleared", "info");
        }

        protected void GvEmployees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmployees.PageIndex = e.NewPageIndex;
            LoadData();
        }

        private void ClearFields()
        {
            TxtName.Text = "";
            TxtEmail.Text = "";
            TxtAddress.Text = "";
            if (DDLEmployees.Items.Count > 0)
                DDLEmployees.SelectedIndex = 0;
        }

        private void LoadData()
        {
            try
            {
                DataTable Dt = BLL.GetUsersBLL();
                
                // Update total count
                LblTotalCount.Text = Dt.Rows.Count.ToString();

                // Bind GridView
                GvEmployees.DataSource = Dt;
                GvEmployees.DataBind();

                // Bind DropDownList
                DDLEmployees.Items.Clear();
                DDLEmployees.DataSource = Dt;
                DDLEmployees.DataTextField = "Name";
                DDLEmployees.DataValueField = "Id";
                DDLEmployees.DataBind();
                DDLEmployees.Items.Insert(0, new ListItem("-- Select Employee --", ""));
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading data: " + ex.Message, "danger");
            }
        }

        private void ShowMessage(string message, string type)
        {
            LabResult.Text = message;
            LabResult.CssClass = $"alert alert-{type}";
            LabResult.Attributes["class"] = $"alert alert-{type} d-block";
        }
    }
}
