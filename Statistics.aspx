<%@ Page Title="Statistics" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Statistics" %>

<%@ MasterType VirtualPath="~/Master.master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_Head" Runat="Server"> 
</asp:Content> 
<asp:Content ID="Content5" ContentPlaceHolderID="cph_Body" Runat="Server">
    <asp:DropDownList id="testddl" AutoPostBack="true" runat="server">
        <asp:ListItem Text="BLUE" Value="1">blue</asp:ListItem>
        <asp:ListItem Text="RED" Value="2">red</asp:ListItem>
    </asp:DropDownList>

<!-- BODY GOES HERE! 

   <asp:SqlDataSource 
      ID="sqlCourses" 
      runat="server"
      ConnectionString='<%$ connectionStrings:SEI_TMConnString %>' 
      SelectCommandType="StoredProcedure" 
      SelectCommand="tm_GetTeachersCourses">

      <SelectParameters> 
         <asp:ControlParameter Name="TeacherID" ControlID="ddlTeacher" /> 
      </SelectParameters>

   </asp:SqlDataSource>
-->

   <asp:DropDownList id="ddlCourses" AutoPostBack="true" DataSourceID="sqlCourses" DataTextField="cname" DataValueField="ID" runat="server" />


   <!-- 
   <asp:DropDownList id="ddlCourse" runat="server" AutoPostBack="true"> 
      <asp:ListItem>Selection 1</asp:ListItem> 
      <asp:ListItem>Selection 2</asp:ListItem> 
      <asp:ListItem>Selection 3</asp:ListItem> 
   </asp:DropDownList> 
   -->


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="cph_Foot" Runat="Server"> 
</asp:Content>
