<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="UserWebForm.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LabID" runat="server" Text="Enter Id"></asp:Label>
            <asp:DropDownList ID="DDLUsers" runat="server" Height="16px" style="margin-left: 23px" Width="91px"></asp:DropDownList>
            <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" style="margin-left: 17px; margin-right: 0px; margin-top: 0px;" Height="26px" Width="74px" />
        </div>
        <div>
            <asp:Label ID="LabName" runat="server" Text=" Enter Name"></asp:Label>
            <asp:TextBox ID="TxtName" runat="server" style="margin-left: 10px"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="LabEmail" runat="server" Text=" Enter Email"></asp:Label>
            <asp:TextBox ID="TxtEmail" runat="server" style="margin-left: 8px"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="LabAddress" runat="server" Text=" Enter Address"></asp:Label>
            <asp:TextBox ID="TxtAddress" runat="server" style="margin-left: 11px"></asp:TextBox>
            <br />
        </div>
        <div style="height: 96px">
            <br />
            <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" Height="48px" style="margin-left: 6px" Width="81px" />
            <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click" Height="49px" style="margin-left: 16px" Width="86px" />
            <asp:Button ID="BtnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click" Height="47px" style="margin-left: 13px" Width="86px" />
            <asp:Button ID="BtnClear" runat="server" Text="Clear" OnClick="BtnClear_Click" Height="45px" style="margin-left: 16px" Width="86px" />
            <asp:Label ID="LabResult" runat="server" Text=""></asp:Label>
            <br />
        </div>
            <asp:GridView runat="server" ID="CRUDGrid" style="margin-left: 1px; margin-top: 0px;" Width="381px" Height="16px"></asp:GridView>
        <br />
        <div>
            <br />
            <br />
        </div>
        <div>
        </div>
    </form>
</body>
</html>