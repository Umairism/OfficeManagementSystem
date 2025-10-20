<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="UserWebForm.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1><i class="fas fa-info-circle"></i> About Office Management System</h1>
        <p>Learn more about our comprehensive employee management solution</p>
    </div>

    <div class="row mb-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body p-5">
                    <h2 class="mb-4">Our Mission</h2>
                    <p class="lead">
                        Office Management System is designed to streamline employee record management 
                        for organizations of all sizes. Our goal is to provide a simple, efficient, 
                        and secure platform for managing employee data.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-4 mb-3">
            <div class="card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-rocket fa-3x text-primary mb-3"></i>
                    <h4>Fast & Efficient</h4>
                    <p>Quick access to employee records with intuitive search and filtering capabilities.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-shield-alt fa-3x text-success mb-3"></i>
                    <h4>Secure</h4>
                    <p>Your data is protected with industry-standard security measures and best practices.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-users fa-3x text-warning mb-3"></i>
                    <h4>User Friendly</h4>
                    <p>Clean interface designed for ease of use, requiring minimal training.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-list-check"></i> Key Features
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <ul class="list-unstyled">
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Employee Registration</li>
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Quick Search Functionality</li>
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Update Employee Records</li>
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Delete Employee Records</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul class="list-unstyled">
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Dashboard with Statistics</li>
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Responsive Design</li>
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Professional UI</li>
                                <li class="mb-2"><i class="fas fa-check-circle text-success"></i> Easy Data Export</li>
                            </ul>
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

        .list-unstyled {
            padding-left: 0;
            list-style: none;
        }

        .list-unstyled li i {
            margin-right: 10px;
        }
    </style>

</asp:Content>
