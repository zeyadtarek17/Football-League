using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DatabaseProject
{
    public partial class RegisterFanView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string fname = n.Text;
            string fusername = us.Text;
            string fpassword = p.Text;
            string fid = i.Text;
            string fphone = po.Text;
            string fbirth = TextBox5.Text;
            string faddress = a.Text;
            SqlCommand freg = new SqlCommand("addFan", conn);
            freg.CommandType = System.Data.CommandType.StoredProcedure;

            if (!string.IsNullOrWhiteSpace(fname) && !string.IsNullOrWhiteSpace(fusername) && !string.IsNullOrWhiteSpace(fpassword) && !string.IsNullOrWhiteSpace(fid) && !string.IsNullOrWhiteSpace(fphone) && !string.IsNullOrWhiteSpace(TextBox5.Text) && !string.IsNullOrWhiteSpace(faddress))
            {
                using (SqlCommand comd = new SqlCommand("select count(*) from [SystemUser] where username = @username", conn))
                {   conn.Open();
                    comd.Parameters.AddWithValue("username", us.Text);
                    if ((int)comd.ExecuteScalar() > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username Already Taken')", true);
                    }
                    else
                    {
                        if (!po.Text.All(char.IsDigit))
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('please enter a valid phone number')", true);
                        }
                        else
                        {
                            freg.Parameters.Add(new SqlParameter("@fan_name", fname));
                            freg.Parameters.Add(new SqlParameter("@fan_username", fusername));
                            freg.Parameters.Add(new SqlParameter("@fan_password", fpassword));
                            freg.Parameters.Add(new SqlParameter("@fan_national_id", fid));
                            freg.Parameters.Add(new SqlParameter("@fan_phone_number", fphone));
                            freg.Parameters.Add(new SqlParameter("@fan_birth_date", DateTime.Parse(TextBox5.Text)));
                            freg.Parameters.Add(new SqlParameter("@fan_address", faddress));
                            
                            freg.ExecuteNonQuery();
                            conn.Close();
                            Response.Redirect("Login.aspx");
                        }
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('please fill in all fields')", true);
            }




        }
    }
}