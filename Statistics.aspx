<%@ Page Title="Statistics" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Statistics" %>
<%@ MasterType VirtualPath="~/Master.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Body" Runat="Server">
    <asp:SqlDataSource ID="sqlTeachers" runat="server" ConnectionString='<%$ connectionStrings:SEI_TMConnString %>'
                       SelectCommandType="StoredProcedure"
                       SelectCommand="tm_GetTeachers">
    </asp:SqlDataSource>
	
	<asp:SqlDataSource ID="sqlCourses" runat="server" ConnectionString='<%$ connectionStrings:SEI_TMConnString %>'
                       SelectCommandType="StoredProcedure"
                       SelectCommand="tm_GetTeachersCourses">
        <SelectParameters>
            <asp:ControlParameter Name="TeacherID" ControlID="ddlTeacher" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlStats" runat="server" ConnectionString='<%$ connectionStrings:SEI_TMConnString %>'
                       SelectCommandType="StoredProcedure"
                       SelectCommand="tm_GetWeeklyStats">
		<SelectParameters>
            <asp:ControlParameter Name="CourseID" ControlID="ddlCourses" />
        </SelectParameters>
    </asp:SqlDataSource>

    
    <asp:DropDownList ID="ddlTeachers" DataSourceID="sqlTeachers" DataTextField="tName" DataValueField="ID" AutoPostBack="true" OnChanged="ddlTeachers_OnChanged" runat="server" />&nbsp;&nbsp;
	<asp:DropDownList ID="ddlCourses" DataSourceID="sqlCourses" DataTextField="cName" DataValueField="ID" AutoPostBack="true" OnChanged="ddlCourses_OnChanged" runat="server" />
    <br /><br />
    <asp:GridView ID="gdvStats" AutoGenerateColumns="false" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_Foot" Runat="Server">
</asp:Content>

