using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM Users WHERE Username = @Username";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EcoBase"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Username", txtUserName.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {

                //username found
                Object objPasswordHash = dt.Rows[0]["PasswordHash"];
                Object objRole = dt.Rows[0]["Role"];
                Object objEnabled = dt.Rows[0]["Enabled"];
                string password = txtPassword.Text;
                string storedPasswordHash = objPasswordHash.ToString();

                PBKDF2Hash hash = new PBKDF2Hash(password, storedPasswordHash);
                bool check = hash.PasswordCheck;
                bool enabled = Convert.ToBoolean(objEnabled);

                if (check == true && enabled == true)
                {
                    //password correct and account enabled
                    Session["Username"] = txtUserName.Text;
                    Session["Role"] = objRole.ToString();
                    if (Session["Role"].ToString() == "Users")
                    {
                        Response.Redirect("EcoMart.aspx");
                    }
                    else if (Session["Role"].ToString() == "admin")
                    {
                        Response.Redirect("Admin.aspx");
                    }
                }
                else
                {
                    //password incorrect or account disabled
                    lblStatus.Text = "Incorrect password or account disabled";
                }
            }
            else
            {
                //username not found
                lblStatus.Text = "Incorrect username";
            }
        }
    }
}