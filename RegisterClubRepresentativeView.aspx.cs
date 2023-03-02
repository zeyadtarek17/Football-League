using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DatabaseProject
{
    public partial class RegisterClubRepresentativeView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            string repname = Name.Text;
            string repusername = us.Text;
            string reppassword = password.Text;
            string repclubname = ClubList.Text;
            SqlCommand repreg = new SqlCommand("addRepresentative", conn);
            repreg.CommandType = System.Data.CommandType.StoredProcedure;
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

                    repreg.Parameters.Add(new SqlParameter("@club_representative_name", repname));
                    repreg.Parameters.Add(new SqlParameter("@club_representative_username", repusername));
                    repreg.Parameters.Add(new SqlParameter("@club_representative_password", reppassword));
                    repreg.Parameters.Add(new SqlParameter("@club_name", repclubname));
                    conn.Open();
                    repreg.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");



                }
            }

        }
    }
}