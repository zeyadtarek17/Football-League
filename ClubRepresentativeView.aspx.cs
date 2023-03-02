using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class ClubRepresentativeView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void infocl_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string am = "select c.id, c.name, c.location from Club c, Club_Representative cr where cr.username = @uname and cr.club_id = c.id";
            SqlCommand nw = new SqlCommand(am, conn);
            conn.Open();
            nw.Parameters.Add(new SqlParameter("@uname", Session["uname"]));
            SqlDataReader r = nw.ExecuteReader();
            vaci.DataSource = r;
            vaci.DataBind();
            conn.Close();

        }

        protected void clm_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string clm = "select c.name from Club c , Club_representative cr where cr.username = @uname and cr.club_id = c.id";
            SqlCommand cl = new SqlCommand(clm, conn);

            conn.Open();
            cl.Parameters.Add(new SqlParameter("@uname", Session["uname"]));
            SqlDataReader r = cl.ExecuteReader();
            r.Read();
            string rname= r[0].ToString();
           
            SqlCommand cmd = new SqlCommand("SELECT * from [dbo].upcomingMatchesOfClub('" + rname + "')");
            cmd.Connection = conn;
            SqlDataReader cmdreader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            
            vaum.DataSource = dt;
            vaum.DataBind();
            conn.Close();

        }

        protected void avst_Click(object sender, EventArgs e)
        {

        }

        protected void clrequ_Click(object sender, EventArgs e)
        {

        }
    }
}