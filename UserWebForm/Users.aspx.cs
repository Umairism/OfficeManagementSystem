using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppProps;
using BusinessLogicLayer;

namespace UserWebForm
{
    public partial class WebForm1 : System.Web.UI.Page
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
                    LabResult.Text = "Please fill all fields";
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
                    LabResult.Text = "Data saved successfully";
                }
                else
                {
                    LabResult.Text = "Error: data not saved";
                }
            }
            catch (Exception ex)
            {
                LabResult.Text = "Error: " + ex.Message;
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DDLUsers.SelectedValue))
                {
                    LabResult.Text = "Please select a user to update record";
                    return;
                }

                if (string.IsNullOrWhiteSpace(TxtName.Text) || string.IsNullOrWhiteSpace(TxtEmail.Text) || string.IsNullOrWhiteSpace(TxtAddress.Text))
                {
                    LabResult.Text = "Please fill all fields";
                    return;
                }

                User U = new User()
                {
                    Id = int.Parse(DDLUsers.SelectedValue),
                    Name = TxtName.Text.Trim(),
                    Email = TxtEmail.Text.Trim(),
                    Address = TxtAddress.Text.Trim()
                };

                if (BLL.UpdateUserBLL(U))
                {
                    LoadData();
                    ClearFields();
                    LabResult.Text = "Data updated successfully";
                }
                else
                {
                    LabResult.Text = "Error: data not updated";
                }
            }
            catch (Exception ex)
            {
                LabResult.Text = "Error: " + ex.Message;
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DDLUsers.SelectedValue))
                {
                    LabResult.Text = "Please select a user to delete the record";
                    return;
                }

                User U = new User()
                {
                    Id = int.Parse(DDLUsers.SelectedValue)
                };

                if (BLL.DeleteUserBLL(U))
                {
                    LoadData();
                    ClearFields();
                    LabResult.Text = "Data deleted successfully";
                }
                else
                {
                    LabResult.Text = "Error: data not deleted";
                }
            }
            catch (Exception ex)
            {
                LabResult.Text = "Error: " + ex.Message;
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DDLUsers.SelectedValue))
                {
                    LabResult.Text = "Please select a user to search";
                    return;
                }

                User U = new User()
                {
                    Id = int.Parse(DDLUsers.SelectedValue)
                };

                DataTable Dt = BLL.UserSearchBLL(U);

                if (Dt != null && Dt.Rows.Count > 0)
                {
                    DataRow row = Dt.Rows[0];
                    TxtName.Text = row["Name"].ToString();
                    TxtEmail.Text = row["Email"].ToString();
                    TxtAddress.Text = row["Address"].ToString();
                    LabResult.Text = "User found and loaded for editing";
                }
                else
                {
                    LabResult.Text = "User not found";
                    TxtName.Text = "";
                    TxtEmail.Text = "";
                    TxtAddress.Text = "";
                }
            }
            catch (Exception ex)
            {
                LabResult.Text = "Error: " + ex.Message;
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        private void ClearFields()
        {
            TxtName.Text = "";
            TxtEmail.Text = "";
            TxtAddress.Text = "";
            LabResult.Text = "";
            if (DDLUsers.Items.Count > 0)
                DDLUsers.SelectedIndex = 0;
        }

        private void LoadData()
        {
            try
            {
                DataTable Dt = BLL.GetUsersBLL();
                CRUDGrid.DataSource = Dt;
                CRUDGrid.DataBind();

                DDLUsers.Items.Clear();
                DDLUsers.DataSource = Dt;
                DDLUsers.DataTextField = "Name";
                DDLUsers.DataValueField = "Id";
                DDLUsers.DataBind();
                DDLUsers.Items.Insert(0, new ListItem("-- Select User --", ""));
            }
            catch (Exception ex)
            {
                LabResult.Text = "Error loading data: " + ex.Message;
            }
        }
    }
}