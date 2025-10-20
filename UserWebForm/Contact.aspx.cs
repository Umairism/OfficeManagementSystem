using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserWebForm
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSendMessage_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(TxtContactName.Text) || 
                    string.IsNullOrWhiteSpace(TxtContactEmail.Text) || 
                    string.IsNullOrWhiteSpace(TxtContactSubject.Text) || 
                    string.IsNullOrWhiteSpace(TxtContactMessage.Text))
                {
                    ShowMessage("Please fill in all fields", "warning");
                    return;
                }

                // Here you would typically send an email or save to database
                // For now, we'll just show a success message

                ShowMessage("Thank you! Your message has been sent successfully. We'll get back to you soon.", "success");
                
                // Clear form
                TxtContactName.Text = "";
                TxtContactEmail.Text = "";
                TxtContactSubject.Text = "";
                TxtContactMessage.Text = "";
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "danger");
            }
        }

        private void ShowMessage(string message, string type)
        {
            LabContactResult.Text = message;
            LabContactResult.CssClass = $"alert alert-{type} d-block";
        }
    }
}