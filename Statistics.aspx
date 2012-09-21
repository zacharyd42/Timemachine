<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Statistics" %>
<%@ MasterType VirtualPath="~/Master.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Body" Runat="Server">
    <asp:SqlDataSource ID="sqlCourses" runat="server" ConnectionString='<%$ connectionStrings:SEI_TMConnString %>'
                       SelectCommandType="StoredProcedure"
                       SelectCommand="tm_GetTeachersCourses">
        <SelectParameters>
            <asp:ControlParameter Name="TeacherID" ControlID="ddlTeacher" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqllotsofstuff" runat="server" ConnectionString='<%$ connectionStrings:SEI_TMConnString %>'
                       SelectCommandType="StoredProcedure"
                       SelectCommand="tm_GetCourseList">
    </asp:SqlDataSource>

    
    <asp:DropDownList ID="ddlCourses" DataSourceID="sqlCourses" DataTextField="cName" DataValueField="ID" runat="server" />

    <br /><br />
    <asp:GridView ID="gdvStats" DataSourceID="sqllotsofstuff" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>ID</HeaderTemplate>
                <ItemTemplate>
                    <%# Eval("ID").ToString()%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>Col2</HeaderTemplate>
                <ItemTemplate>
                    <%# Eval("cName").ToString()%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_Foot" Runat="Server">
</asp:Content>

