using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Statistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			ddlTeachers.DataBind();
			ddlCourses.DataBind();
        	gdvStats.DataSource = getStats();
			gdvStats.DataBind();
		}
    }
	
	protected void ddlTeachers_OnChanged(Object sender, EventArgs e)
	{
		ddlCourses.DataBind();
		gdvStats.DataSource = getStats();
		gdvStats.DataBind();
	}
	
	protected void ddlCourses_OnChanged(Object sender, EventArgs e)
	{
		gdvStats.DataSource = getStats();
		gdvStats.DataBind();
	}
	
	private DataTable getStats()
	{
		DataColumn dcTemp;
		DataTable dtStats = new DataTable();
		dcTemp = new DataColumn("Name");
		dtStats.Columns.Add (dcTemp);
		dcTemp = new DataColumn("Sem Total");
		dtStats.Columns.Add (dcTemp);
		//for loop to add correct number of columns for semester
		
		SqlConnection scstat = new SqlConnection(Master.Conn);
        scstat.Open();
		
		SqlCommand cmdGetStats = new SqlCommand("tm_GetWeeklyStats", scstat);
        cmdGetStats.CommandType = CommandType.StoredProcedure;
        cmdGetStats.Parameters.AddWithValue("@ClassID", ddlCourses.SelectedValue);
        SqlDataReader rdstats = cmdGetStats.ExecuteReader();
		
		if (rdstats.HasRows)
        {
            while (rdstats.Read())
            {
				//figure out how to parse database return.
			}
		}
		
		rdstats.Close();
		rdstats.Dispose();
		cmdGetStats.Dispose();
		scstat.Close();
		scstat.Dispose();
		
		return dtStats;
	}
}