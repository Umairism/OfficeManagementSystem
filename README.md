# Office Management System

A professional, modern web application for managing employee records built with ASP.NET Web Forms and .NET Framework 4.8.

![.NET Framework](https://img.shields.io/badge/.NET%20Framework-4.8-blue)
![ASP.NET](https://img.shields.io/badge/ASP.NET-Web%20Forms-green)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple)
![SQL Server](https://img.shields.io/badge/SQL%20Server-Database-red)

## ?? Overview

Office Management System is a comprehensive employee management solution featuring a modern, responsive UI with complete CRUD operations, dashboard statistics, and professional design patterns.

---

# Office Management System - Fixed Issues & Setup Guide

## Issues Resolved ?

### 1. **Database Connection Issues**
- ? Added proper error handling in `DbCon.Search()` method
- ? Fixed potential connection leaks with try-catch blocks
- ? Connection properly closes even on errors

### 2. **Data Loading Issues**
- ? Added `DDLUsers.Items.Clear()` before binding to prevent duplicate items
- ? Added try-catch in `LoadData()` method
- ? Fixed potential crash when dropdown has no items

### 3. **Input Validation**
- ? Added validation for empty fields in Save and Update operations
- ? Added `.Trim()` to remove whitespace from user inputs
- ? Better error messages for user feedback

### 4. **Error Handling**
- ? Added try-catch blocks to all button click events
- ? Proper null checks before accessing DataTable rows
- ? Fixed `ClearFields()` to check if dropdown has items before clearing

### 5. **SQL View Setup**
- ? Created SQL script to map Students table to Users view
- ? Phone_No field is mapped to Email field
- ? No code changes needed - works with existing logic

## Setup Instructions

### Step 1: Run the Database Script
1. Open SQL Server Management Studio (SSMS)
2. Connect to your server: `Alyan_Kabir\SQLEXPRESS`
3. Open the file: `Database\SetupDatabase.sql`
4. Execute the script (F5)
5. Verify by running: `SELECT * FROM dbo.Users`

### Step 2: Verify Connection String
Check that `DataAccessLayer\DbCon.cs` has the correct connection string:
```csharp
Data Source=Alyan_Kabir\SQLEXPRESS;Initial Catalog=CRUD;Integrated Security=True;Encrypt=True;TrustServerCertificate=True
```

### Step 3: Build and Run
1. Open the solution in Visual Studio
2. Set `UserWebForm` as the startup project (right-click project ? Set as Startup Project)
3. Press F5 to run
4. Navigate to `Users.aspx`

## Project Structure

```
OfficeManagementSystem/
??? AppProps/                    # Data models (User class)
??? DataAccessLayer/             # Database operations (DbCon, UserDAL)
??? BusinessLogicLayer/          # Business logic (UserBLL)
??? UserWebForm/                 # Web UI (Users.aspx)
??? PresentationLayer/           # (unused in current setup)
??? Database/                    # SQL setup scripts
```

## Features Implemented

? **Create** - Add new users to the database
? **Read** - View all users in GridView and DropDownList
? **Update** - Modify existing user records
? **Delete** - Remove users from database
? **Search** - Load user details by selecting from dropdown

## How to Use

1. **Add New User**:
   - Fill Name, Email, Address fields
   - Click "Save" button
   
2. **Search User**:
   - Select user from dropdown
   - Click "Search" button
   - Details will populate in text boxes

3. **Update User**:
   - Select user from dropdown
   - Click "Search" to load details
   - Modify the fields
   - Click "Update" button

4. **Delete User**:
   - Select user from dropdown
   - Click "Delete" button

5. **Clear Form**:
   - Click "Clear" button to reset all fields

## Database Schema Mapping

### Students Table (Physical)
- Id (INT, IDENTITY, PRIMARY KEY)
- Name (NVARCHAR(200))
- Address (NVARCHAR(200))
- Phone_No (NVARCHAR(200))

### Users View (Logical)
- Id ? Students.Id
- Name ? Students.Name
- Email ? Students.Phone_No
- Address ? Students.Address

## Known Limitations

?? **SQL Injection**: The current implementation uses string concatenation for SQL queries. For production use, this should be replaced with parameterized queries.

?? **No Authentication**: The application has no user authentication or authorization.

?? **Basic Validation**: Only checks for empty fields. Should add email format validation, length checks, etc.

## Future Improvements (Recommended)

1. **Security**: Implement parameterized SQL queries
2. **Validation**: Add comprehensive input validation (email format, max length, etc.)
3. **Authentication**: Add login/logout functionality
4. **Logging**: Add error logging to file or database
5. **Confirmation**: Add JavaScript confirmation before delete operations
6. **Paging**: Add pagination to GridView for large datasets

## Troubleshooting

### Issue: "Cannot connect to database"
**Solution**: 
- Verify SQL Server is running
- Check connection string in `DbCon.cs`
- Ensure CRUD database exists

### Issue: "Users table not found"
**Solution**: 
- Run the `SetupDatabase.sql` script
- Verify the view was created: `SELECT * FROM dbo.Users`

### Issue: "Dropdown is empty"
**Solution**: 
- Ensure Students table has data
- Check if the Users view returns data
- Verify connection string is correct

### Issue: Build errors
**Solution**: 
- Clean solution (Build ? Clean Solution)
- Rebuild solution (Build ? Rebuild Solution)
- Check all project references are loaded correctly

## Contact & Support

For issues or questions, check the following:
1. Verify all files are present and up to date
2. Ensure .NET Framework 4.8 is installed
3. Check SQL Server is accessible
4. Review error messages in `LabResult` label on the web form

---

**Version**: 1.0
**Target Framework**: .NET Framework 4.8
**Database**: SQL Server (Students table mapped via Users view)
