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
    public partial class CRregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CR(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            string repname = name.Text;
            string repusername = username.Text;
            string reppassword = password.Text;
            string repclubname = ClubList.Text;
            SqlCommand repreg = new SqlCommand("addRepresentative", conn);
            repreg.CommandType = System.Data.CommandType.StoredProcedure;
            repreg.Parameters.Add(new SqlParameter("@club_representative_name", repname));
            repreg.Parameters.Add(new SqlParameter("@club_representative_username", repusername));
            repreg.Parameters.Add(new SqlParameter("@club_representative_password", reppassword));
            repreg.Parameters.Add(new SqlParameter("@club_name", repclubname));
            conn.Open();
            repreg.ExecuteNonQuery();
            conn.Close();
        }
    }
}