using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class AccountType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void f_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterFanView.aspx");
        }

        protected void c_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterClubRepresentativeView.aspx");
        }

        protected void sm_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterSportsManagerView.aspx");
        }

        protected void st_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterStadiumManagerView.aspx");
        }
    }
}