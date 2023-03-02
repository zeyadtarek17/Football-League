using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DatabaseProject
{
    public partial class RegisterStadiumManagerView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            string stname = n.Text;
            string stusername = us.Text;
            string stpassword = p.Text;
            string ststadiumname = StadiumList.Text;
            SqlCommand streg = new SqlCommand("addStadiumManager", conn);
            streg.CommandType = System.Data.CommandType.StoredProcedure;
            
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

                    streg.Parameters.Add(new SqlParameter("@stadium_manager_name", stname));
                    streg.Parameters.Add(new SqlParameter("@stadium_manager_username", stusername));
                    streg.Parameters.Add(new SqlParameter("@stadium_manager_password ", stpassword));
                    streg.Parameters.Add(new SqlParameter("@stadium_name", ststadiumname));
                    conn.Open();
                    streg.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");



                }
            }
        }
    }
}