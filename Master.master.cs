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
        String str_conn = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["SEI_TMConnString"].ConnectionString;
    #endregion

    #region Properties
        public String Conn
        {
            get
            {
                return str_conn;
            }
        }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        // Open the connection to DB
        SqlConnection TM_DB = new SqlConnection(Conn);

        // Open the connection
        TM_DB.Open();




        TM_DB.Close();
    }

    // Pulling the DB to load user info
    private void Load_user(SqlConnection user_db)
    {

        // Create a command to execute a stored procedure
        SqlCommand command_GetUser = new SqlCommand("tm_GetUser", user_db);
        command_GetUser.CommandType = CommandType.StoredProcedure;

        // Add a parameter that's passed to the stored proc,
        // this is the order ID we selected
        command_GetUser.Parameters.AddWithValue("@UserID", Session["s_user"].ToString());

        // Get the reader
        SqlDataReader user_reader = command_GetUser.ExecuteReader();

        // Process each result in the result set
        if (user_reader.HasRows)
        {
            while (user_reader.Read())
            {
                break;
            }

        }

    }




}
