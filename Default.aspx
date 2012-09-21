﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <asp:Label ID="lbl_error_message" ForeColor="Red" runat="server" /><br />
    <form id="loginForm" runat="server">
        Username: <asp:TextBox ID="txt_username" runat="server" /><br />
        Password: <asp:TextBox ID="txt_password" TextMode="Password" runat="server" /><br />
        <asp:Button ID="LoginButton" OnClick="LoginButtonClick" Text="Login" runat="server" />
    </form>
</body>
</html>
