<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserWebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h1><i class="fas fa-chart-line"></i> Dashboard</h1>
        <p>Welcome to Office Management System - Overview of your organization</p>
    </div>

    <!-- Statistics Cards -->
    <div class="row mb-4">
        <div class="col-md-3 mb-3">
            <div class="card text-white" style="background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title mb-0">Total Employees</h6>
                            <h2 class="mt-2 mb-0"><asp:Label ID="LblTotalEmployees" runat="server" Text="0"></asp:Label></h2>
                        </div>
                        <div>
                            <i class="fas fa-users fa-3x" style="opacity: 0.3;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-white" style="background: linear-gradient(135deg, #27ae60 0%, #229954 100%);">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title mb-0">Active Today</h6>
                            <h2 class="mt-2 mb-0"><asp:Label ID="LblActiveToday" runat="server" Text="0"></asp:Label></h2>
                        </div>
                        <div>
                            <i class="fas fa-user-check fa-3x" style="opacity: 0.3;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-white" style="background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title mb-0">Departments</h6>
                            <h2 class="mt-2 mb-0"><asp:Label ID="LblDepartments" runat="server" Text="5"></asp:Label></h2>
                        </div>
                        <div>
                            <i class="fas fa-building fa-3x" style="opacity: 0.3;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-white" style="background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title mb-0">New This Month</h6>
                            <h2 class="mt-2 mb-0"><asp:Label ID="LblNewThisMonth" runat="server" Text="0"></asp:Label></h2>
                        </div>
                        <div>
                            <i class="fas fa-user-plus fa-3x" style="opacity: 0.3;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-bolt"></i> Quick Actions
                </div>
                <div class="card-body">
                    <div class="row text-center">
                        <div class="col-md-3 mb-3">
                            <a href="Employees.aspx" class="text-decoration-none">
                                <div class="p-4 bg-light rounded">
                                    <i class="fas fa-user-plus fa-3x text-primary mb-3"></i>
                                    <h5 class="text-dark">Add Employee</h5>
                                    <p class="text-muted small">Register new employee</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="Employees.aspx" class="text-decoration-none">
                                <div class="p-4 bg-light rounded">
                                    <i class="fas fa-list fa-3x text-success mb-3"></i>
                                    <h5 class="text-dark">View All</h5>
                                    <p class="text-muted small">See all employees</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="Employees.aspx" class="text-decoration-none">
                                <div class="p-4 bg-light rounded">
                                    <i class="fas fa-search fa-3x text-warning mb-3"></i>
                                    <h5 class="text-dark">Search</h5>
                                    <p class="text-muted small">Find employee records</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="#" class="text-decoration-none">
                                <div class="p-4 bg-light rounded">
                                    <i class="fas fa-chart-bar fa-3x text-danger mb-3"></i>
                                    <h5 class="text-dark">Reports</h5>
                                    <p class="text-muted small">Generate reports</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Employees -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-history"></i> Recent Employees
                </div>
                <div class="card-body">
                    <asp:GridView ID="GvRecentEmployees" runat="server" CssClass="table table-striped table-hover" 
                        AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email/Phone" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                        </Columns>
                        <HeaderStyle BackColor="#2c3e50" ForeColor="White" Font-Bold="True" />
                        <EmptyDataTemplate>
                            <div class="text-center py-5">
                                <i class="fas fa-inbox fa-3x text-muted mb-3"></i>
                                <p class="text-muted">No employees found. Add your first employee!</p>
                                <a href="Employees.aspx" class="btn btn-primary">
                                    <i class="fas fa-plus"></i> Add Employee
                                </a>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
