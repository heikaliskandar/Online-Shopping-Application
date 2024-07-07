using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void ButtonLoadDetails_Click(object sender, EventArgs e)
        {          
                SqlDataSource dataSource = new SqlDataSource();
                dataSource.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EcoBase"].ToString();
                dataSource.SelectCommand = "EXEC GetDetailedSales";
                GridViewDetails.DataSource = dataSource;
                GridViewDetails.DataBind();
                GridViewDetails.Visible = true;

        }
    }
}