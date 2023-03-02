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
    public partial class SportsManagerView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void am_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addm = new SqlCommand("addNewMatch", conn);
            string hcname = hcn.Text;
            string gcname = gcn.Text;
            string stime = st.Text;
            string etime = et.Text;

            addm.CommandType = System.Data.CommandType.StoredProcedure;
            if (!string.IsNullOrWhiteSpace(hcname) && !string.IsNullOrWhiteSpace(gcname) && !string.IsNullOrWhiteSpace(stime) && !string.IsNullOrWhiteSpace(etime))
            {
                if (hcname == gcname)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Information')", true);
                }
                else { 
                addm.Parameters.Add(new SqlParameter("@host_name", hcname));
                addm.Parameters.Add(new SqlParameter("@guest_name", gcname));
                addm.Parameters.Add(new SqlParameter("@start_time", DateTime.Parse(stime)));
                addm.Parameters.Add(new SqlParameter("@end_time", DateTime.Parse(etime)));
                conn.Open();
                addm.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("SportsManagerView.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }

        }

        protected void del_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand delm = new SqlCommand("deleteMatch", conn);
            string hcname = hcnn.Text;
            string gcname = gnc.Text;
            string stime = stt.Text;
            string etime = ett.Text;

            delm.CommandType = System.Data.CommandType.StoredProcedure;
            if (!string.IsNullOrWhiteSpace(hcname) && !string.IsNullOrWhiteSpace(gcname) && !string.IsNullOrWhiteSpace(stime) && !string.IsNullOrWhiteSpace(etime))
            {
                if (hcname == gcname)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Information')", true);
                }
                else
                {
                    delm.Parameters.Add(new SqlParameter("@host_name", hcname));
                    delm.Parameters.Add(new SqlParameter("@guest_name", gcname));
                    delm.Parameters.Add(new SqlParameter("@starttime", DateTime.Parse(stime)));
                    delm.Parameters.Add(new SqlParameter("@endtime", DateTime.Parse(etime)));
                    conn.Open();
                    delm.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("SportsManagerView.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }
        }

        protected void upm_Click(object sender, EventArgs e)
        {
            
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string up = "select * from UpcomingMatches";
            SqlCommand m = new SqlCommand(up, conn);
            conn.Open();
            SqlDataReader r = (m.ExecuteReader());
            vum.DataSource = r;
            vum.DataBind();
            conn.Close();

        }

        protected void apl_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string pl = "select * from AlreadyPlayedMatches";
            SqlCommand pla = new SqlCommand(pl, conn);
            conn.Open();
            SqlDataReader r = (pla.ExecuteReader());
            vpm.DataSource = r;
            vpm.DataBind();
            conn.Close();


        }

        protected void pnp_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string nvv = "select * from clubsNeverMatched";
            SqlCommand never = new SqlCommand(nvv,conn);
            conn.Open() ;
            SqlDataReader r = (never.ExecuteReader()) ;
            nvm.DataSource= r ;
            nvm.DataBind();
            conn.Close() ;

        }
    }
}