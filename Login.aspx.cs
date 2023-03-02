using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginn (object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PLDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            Session["uname"] = username.Text;
            string un = username.Text;
            string pass = Password.Text;
            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@username", un));
            loginproc.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.VarChar,25);

            success.Direction= ParameterDirection.Output;
            type.Direction= ParameterDirection.Output;

            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();


            if (success.Value.ToString() == "1")
            {
                Session["uname"] = un;

                if (type.Value.ToString() == "Sports Manager")
                {
                    Response.Redirect("SportsManagerView.aspx");
                }
                else if (type.Value.ToString() == "System Admin")
                {
                    Response.Redirect("SystemAdminView.aspx");

                }
                else if (type.Value.ToString() == "Club Representative")
                {
                    Response.Redirect("ClubRepresentativeView.aspx");

                }
                else if (type.Value.ToString() == "Stadium Manager")
                {
                    Response.Redirect("StadiumManagerView.aspx");

                }
                else if (type.Value.ToString() == "Fan")
                {
                    Response.Redirect("FanView.aspx");

                }
            

            }
            else
            {
                Response.Write("Incorrect Username or Password");
            }



        }
        protected void acctype(object sender, EventArgs e)
        {
            Response.Redirect("AccountType.aspx");
        }

        protected void register(object sender, EventArgs e)
        {
            Response.Redirect("RegisterView.aspx");
        }
    }
}