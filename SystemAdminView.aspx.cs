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
    public partial class SystemAdminView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addClub(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string newcln = acl.Text;
            string newcll = loccl.Text;
            SqlCommand addcl = new SqlCommand("addClub", conn);
            addcl.CommandType = System.Data.CommandType.StoredProcedure;

            if (!string.IsNullOrWhiteSpace(newcln) && !string.IsNullOrWhiteSpace(newcll))
            {
                addcl.Parameters.Add(new SqlParameter("@club_name", newcln));
                addcl.Parameters.Add(new SqlParameter("@club_location", newcll));
                conn.Open();
                addcl.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("SystemAdminView.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }


        }


        protected void deletecl_Click(object sender, EventArgs e)
        {
            string connStrr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn1 = new SqlConnection(connStrr);
            string delcll = ClubList.Text;
            SqlCommand delcl = new SqlCommand("deleteClub", conn1);
            delcl.CommandType = System.Data.CommandType.StoredProcedure;
            if (!string.IsNullOrWhiteSpace(delcll))
            {
                delcl.Parameters.Add(new SqlParameter("@club_name", delcll));
                conn1.Open();
                delcl.ExecuteNonQuery();    
                conn1.Close();
                Response.Redirect("SystemAdminView.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }

        }

        protected void addst_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string stn = stname.Text;
            string stl = stlo.Text;
            string stc = stcap.Text;
            SqlCommand addst = new SqlCommand("addStadium", conn);
            addst.CommandType = System.Data.CommandType.StoredProcedure;

            if (!string.IsNullOrWhiteSpace(stn) && !string.IsNullOrWhiteSpace(stl) && !string.IsNullOrWhiteSpace(stc))
            {
                addst.Parameters.Add(new SqlParameter("@stadium_name", stn));
                addst.Parameters.Add(new SqlParameter("@location", stl));
                addst.Parameters.Add(new SqlParameter("@capacity", stc));
                conn.Open();
                addst.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("SystemAdminView.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }

        }

        protected void deletest_Click(object sender, EventArgs e)
        {
            string connStrr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn1 = new SqlConnection(connStrr);
            string stn = DropDownList1.Text;
            SqlCommand delst = new SqlCommand("deleteStadium", conn1);
            delst.CommandType = System.Data.CommandType.StoredProcedure;
            if (!string.IsNullOrWhiteSpace(stn))
            {
                delst.Parameters.Add(new SqlParameter("@stadium_name", delst));

                conn1.Open();
                delst.ExecuteNonQuery();
                conn1.Close();
                Response.Redirect("SystemAdminView.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }
        }

        protected void blockf_Click(object sender, EventArgs e)
        {
            string connStrr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn1 = new SqlConnection(connStrr);
            string fanid = dlfa.Text;
            SqlCommand delfanid = new SqlCommand("blockFan", conn1);
            delfanid.CommandType = System.Data.CommandType.StoredProcedure;
            if (!string.IsNullOrWhiteSpace(fanid))
            {
                delfanid.Parameters.AddWithValue("@national_id", fanid);
                conn1.Open();
                delfanid.ExecuteNonQuery();
                conn1.Close();
                Response.Redirect("SystemAdminView.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }


        }
    }
}