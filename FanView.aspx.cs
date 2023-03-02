using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Security.Cryptography;
using System.Xml.Linq;

namespace DatabaseProject
{
    public partial class FanView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tickets(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        protected void BindGrid()
        {
            string constr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();

            if (!string.IsNullOrWhiteSpace(stt.Text))
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * from [dbo].availableMatchesToAttend('" + DateTime.Parse(stt.Text) + "')"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                ticket.DataSource = dt;
                                ticket.DataBind();
                            }
                        }
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('please fill in all fields')", true);
            }

        }

        protected void pt_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand purchtick = new SqlCommand("purchaseTicket", conn);
            purchtick.CommandType = CommandType.StoredProcedure;
            string nationalID = natId.Text;
            string hostname = hcl.Text;
            string guestname = gcl.Text;
            string datetime = dtime.Text;
            purchtick.CommandType = System.Data.CommandType.StoredProcedure;
            if (!string.IsNullOrWhiteSpace(nationalID) && !string.IsNullOrWhiteSpace(hostname) && !string.IsNullOrWhiteSpace(guestname) && !string.IsNullOrWhiteSpace(datetime))
            {

                if (hostname == guestname)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Information')", true);
                }
                else
                {
                    purchtick.Parameters.Add(new SqlParameter("@fan_national_id", nationalID));
                    purchtick.Parameters.Add(new SqlParameter("@host_name", hostname));
                    purchtick.Parameters.Add(new SqlParameter("@guest_name", guestname));
                    purchtick.Parameters.Add(new SqlParameter("@start_time", DateTime.Parse(datetime)));
                    conn.Open();
                    try
                    {
                        purchtick.ExecuteNonQuery();
                    }
                    catch (SqlException)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sold Out :(')", true);
                    }
                    conn.Close();
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill All The Fields')", true);
            }
        }
    }
}