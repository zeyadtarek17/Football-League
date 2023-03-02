using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class StadiumManagerView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void st_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string am = "select c.id, c.name, c.location, c.capacity from Stadium c, Stadium_Manager cr where cr.username = @uname and cr.stadium_id = c.id";
            SqlCommand nw = new SqlCommand(am, conn);
            conn.Open();
            nw.Parameters.Add(new SqlParameter("@uname", Session["uname"]));
            SqlDataReader r = nw.ExecuteReader();
            vis.DataSource = r;
            vis.DataBind();
            conn.Close();
        }

        protected void req_Click(object sender, EventArgs e)
        {

        }

        protected void ac_Click(object sender, EventArgs e)
        {

        }

        protected void re_Click(object sender, EventArgs e)
        {

        }
    }
}