using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Master : System.Web.UI.MasterPage
{
    #region Variables
        private String str_conn = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["SEI_TMConnString"].ConnectionString;
		
		private Boolean bool_teacher;
		private Boolean bool_admin;
	
		private Int32 intUserType;
    #endregion

    #region Properties
        public String Conn
        {
            get { return str_conn; }
        }
	
		public Boolean isTeacher
        {
            get { return bool_teacher; }
        }
	
		public Boolean isAdmin
        {
            get { return bool_teacher; }
        }
	
		public Boolean UserType
        {
            get { return intUserType; }
        }
    #endregion
	
	#region Protected Functions
	    protected void Page_Load(object sender, EventArgs e)
	    {
	        // Open DB connection
	        SqlConnection TM_DB = new SqlConnection(Conn);
	        TM_DB.Open();

			// Initial load functions
			Load_user(TM_DB);
		
			// Show proper quicklinks
			tcClassesProjects.Visible = isTeacher;
			tcAdmin.Visible = isAdmin;

			// Close DB connection
			TM_DB.Close();
	    }
	#endregion
	
	#region Private Functions
	    // Pulling the DB to load user info
	    private void Load_user(SqlConnection user_db)
	    {
			intUserType = 0;
			
	        //Set up the getuser procedure
	        SqlCommand command_GetUser = new SqlCommand("tm_GetUser", user_db);
	        command_GetUser.CommandType = CommandType.StoredProcedure;
	        command_GetUser.Parameters.AddWithValue("@UserID", Session["s_user"].ToString());
	        SqlDataReader user_reader = command_GetUser.ExecuteReader();
	
	        //Get the first user returned
	        if (user_reader.HasRows)
	        {
	            while (user_reader.Read())
	            {
					intUserType = (Int32)user_reader["UserType"];
					break;
	            }
	        }
			
			bool_teacher = (intUserType >= 1);
			bool_admin = (intUserType >= 2);
	    }
	#endregion
}
