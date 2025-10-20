<%@ Page Title="Employee Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="UserWebForm.Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h1><i class="fas fa-users"></i> Employee Management</h1>
        <p>Manage your organization's employee records efficiently</p>
    </div>

    <!-- Employee Form Card -->
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-user-edit"></i> Employee Information
                </div>
                <div class="card-body">
                    <div class="row">
                        <!-- Search Section -->
                        <div class="col-md-12 mb-4">
                            <div class="p-3 bg-light rounded">
                                <div class="row align-items-center">
                                    <div class="col-md-3">
                                        <label class="form-label fw-bold">
                                            <i class="fas fa-search"></i> Search Employee
                                        </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DDLEmployees" runat="server" CssClass="form-select">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Button ID="BtnSearch" runat="server" Text="?? Search" 
                                            CssClass="btn btn-primary w-100" OnClick="BtnSearch_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Form Fields -->
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">
                                <i class="fas fa-user"></i> Employee Name <span class="text-danger">*</span>
                            </label>
                            <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" 
                                placeholder="Enter employee full name"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">
                                <i class="fas fa-phone"></i> Phone Number / Email <span class="text-danger">*</span>
                            </label>
                            <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" 
                                placeholder="Enter phone number or email"></asp:TextBox>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">
                                <i class="fas fa-map-marker-alt"></i> Address <span class="text-danger">*</span>
                            </label>
                            <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control" 
                                TextMode="MultiLine" Rows="3" placeholder="Enter complete address"></asp:TextBox>
                        </div>

                        <!-- Action Buttons -->
                        <div class="col-md-12">
                            <div class="d-flex gap-2 flex-wrap">
                                <asp:Button ID="BtnSave" runat="server" Text="?? Save" 
                                    CssClass="btn btn-success px-4" OnClick="BtnSave_Click" />
                                <asp:Button ID="BtnUpdate" runat="server" Text="?? Update" 
                                    CssClass="btn btn-primary px-4" OnClick="BtnUpdate_Click" />
                                <asp:Button ID="BtnDelete" runat="server" Text="??? Delete" 
                                    CssClass="btn btn-danger px-4" OnClick="BtnDelete_Click"
                                    OnClientClick="return confirm('Are you sure you want to delete this employee?');" />
                                <asp:Button ID="BtnClear" runat="server" Text="?? Clear" 
                                    CssClass="btn btn-secondary px-4" OnClick="BtnClear_Click" />
                            </div>
                        </div>

                        <!-- Result Message -->
                        <div class="col-md-12 mt-3">
                            <asp:Label ID="LabResult" runat="server" CssClass="alert alert-info d-none" 
                                role="alert"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Employee List Card -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span><i class="fas fa-list"></i> Employee List</span>
                    <span class="badge bg-light text-dark">
                        Total: <asp:Label ID="LblTotalCount" runat="server" Text="0"></asp:Label>
                    </span>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="GvEmployees" runat="server" CssClass="table table-striped table-hover" 
                            AutoGenerateColumns="False" GridLines="None" AllowPaging="True" PageSize="10"
                            OnPageIndexChanging="GvEmployees_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID">
                                    <HeaderStyle Width="80px" />
                                    <ItemStyle CssClass="text-center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Employee Name">
                                    <HeaderStyle Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Contact">
                                    <HeaderStyle Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address">
                                    <HeaderStyle Width="45%" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#2c3e50" ForeColor="White" Font-Bold="True" CssClass="text-center" />
                            <PagerStyle CssClass="pagination justify-content-center mt-3" />
                            <EmptyDataTemplate>
                                <div class="text-center py-5">
                                    <i class="fas fa-users-slash fa-4x text-muted mb-3"></i>
                                    <h4 class="text-muted">No Employees Found</h4>
                                    <p class="text-muted">Start by adding your first employee using the form above.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .d-none {
            display: none !important;
        }

        .d-block {
            display: block !important;
        }

        .gap-2 {
            gap: 0.5rem !important;
        }

        .form-label {
            margin-bottom: 0.5rem;
            color: var(--dark-text);
        }

        .text-danger {
            color: #e74c3c !important;
        }

        .badge {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 5px;
        }

        /* GridView Pagination Styling */
        .GridView tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s;
        }

        /* Button Icons */
        .btn i {
            margin-right: 5px;
        }

        /* Alert Styling */
        .alert {
            border-radius: 8px;
            padding: 15px 20px;
            margin-top: 15px;
            font-weight: 500;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
        }

        .alert-info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }

        /* Table Responsive */
        .table-responsive {
            border-radius: 8px;
        }

        /* Form Control Focus Effect */
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
            border-color: #3498db;
        }
    </style>

    <script type="text/javascript">
        // Auto-hide alert messages after 5 seconds
        setTimeout(function () {
            var alert = document.querySelector('.alert');
            if (alert && !alert.classList.contains('d-none')) {
                alert.classList.add('d-none');
            }
        }, 5000);
    </script>

</asp:Content>
