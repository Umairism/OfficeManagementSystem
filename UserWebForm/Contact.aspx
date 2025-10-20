<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="UserWebForm.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1><i class="fas fa-envelope"></i> Contact Us</h1>
        <p>Get in touch with our support team</p>
    </div>

    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-header">
                    <i class="fas fa-address-card"></i> Contact Information
                </div>
                <div class="card-body">
                    <div class="mb-4">
                        <h5><i class="fas fa-map-marker-alt text-primary"></i> Office Address</h5>
                        <p class="text-muted">
                            Office Management System<br />
                            Technology Park, Main Street<br />
                            City, State - 12345<br />
                            Country
                        </p>
                    </div>

                    <div class="mb-4">
                        <h5><i class="fas fa-phone text-success"></i> Phone</h5>
                        <p class="text-muted">
                            Main: +1 (555) 123-4567<br />
                            Support: +1 (555) 123-4568
                        </p>
                    </div>

                    <div class="mb-4">
                        <h5><i class="fas fa-envelope text-danger"></i> Email</h5>
                        <p class="text-muted">
                            General Inquiries: <a href="mailto:info@officemanagement.com">info@officemanagement.com</a><br />
                            Technical Support: <a href="mailto:support@officemanagement.com">support@officemanagement.com</a>
                        </p>
                    </div>

                    <div class="mb-4">
                        <h5><i class="fas fa-clock text-warning"></i> Business Hours</h5>
                        <p class="text-muted">
                            Monday - Friday: 9:00 AM - 6:00 PM<br />
                            Saturday: 10:00 AM - 4:00 PM<br />
                            Sunday: Closed
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-header">
                    <i class="fas fa-paper-plane"></i> Send us a Message
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Name</label>
                        <asp:TextBox ID="TxtContactName" runat="server" CssClass="form-control" 
                            placeholder="Enter your name"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Email</label>
                        <asp:TextBox ID="TxtContactEmail" runat="server" CssClass="form-control" 
                            TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Subject</label>
                        <asp:TextBox ID="TxtContactSubject" runat="server" CssClass="form-control" 
                            placeholder="Enter subject"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Message</label>
                        <asp:TextBox ID="TxtContactMessage" runat="server" CssClass="form-control" 
                            TextMode="MultiLine" Rows="5" placeholder="Enter your message"></asp:TextBox>
                    </div>

                    <asp:Button ID="BtnSendMessage" runat="server" Text="📧 Send Message" 
                        CssClass="btn btn-primary w-100" OnClick="BtnSendMessage_Click" />

                    <div class="mt-3">
                        <asp:Label ID="LabContactResult" runat="server" CssClass="alert d-none" 
                            role="alert"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-question-circle"></i> Frequently Asked Questions
                </div>
                <div class="card-body">
                    <div class="accordion" id="faqAccordion">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                    How do I add a new employee?
                                </button>
                            </h2>
                            <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Navigate to the Employees page, fill in the required fields (Name, Phone/Email, Address), 
                                    and click the Save button.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                    How can I update employee information?
                                </button>
                            </h2>
                            <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Select the employee from the dropdown list, click Search to load their details, 
                                    make your changes, and click the Update button.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                    Is my data secure?
                                </button>
                            </h2>
                            <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Yes, we implement industry-standard security measures to protect your data. 
                                    All data is stored securely in SQL Server with proper access controls.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .h-100 {
            height: 100%;
        }

        .accordion-button {
            background-color: #f8f9fa;
            color: var(--dark-text);
        }

        .accordion-button:not(.collapsed) {
            background-color: var(--secondary-color);
            color: white;
        }

        .accordion-item {
            border: 1px solid #dee2e6;
            margin-bottom: 10px;
            border-radius: 8px;
            overflow: hidden;
        }
    </style>

</asp:Content>
