using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DatabaseProject
{
    public partial class RegisterSportsManagerView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reg_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            string spname = n.Text;
            string spusername = us.Text;
            string sppassword = p.Text;
            SqlCommand spreg = new SqlCommand("addAssociationManager", conn);
            spreg.CommandType = System.Data.CommandType.StoredProcedure;
           
            using (SqlCommand comd = new SqlCommand("select count(*) from [SystemUser] where username = @username", conn))
            {
                conn.Open();
                comd.Parameters.AddWithValue("username", us.Text);
                if ((int)comd.ExecuteScalar() > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username Already Taken')", true);
                }
                else
                {

                    spreg.Parameters.Add(new SqlParameter("@@association_manager_name", spname));
                    spreg.Parameters.Add(new SqlParameter("@association_manager_username", spusername));
                    spreg.Parameters.Add(new SqlParameter("@association_manager_password", sppassword));
                    conn.Open();
                    spreg.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");



                }
            }
        }
    }
}