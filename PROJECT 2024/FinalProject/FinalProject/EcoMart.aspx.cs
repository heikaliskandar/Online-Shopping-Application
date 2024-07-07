using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class EcoForm : System.Web.UI.Page
    {
        static double totalAmount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                GenerateSalesId();
            }
        }

        void GenerateSalesId()
        {
            string hexTicks = DateTime.Now.Ticks.ToString("X");
            lblSalesID.Text = hexTicks.Substring(hexTicks.Length - 15, 9);
            lblDateTime.Text = DateTime.Now.ToString();
        }

        protected void SelectCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chk.NamingContainer;
            if (chk.Checked)
            {
                lblProductID.Text = row.Cells[1].Text;
                lblProductName.Text = row.Cells[2].Text;
                lblProductPrice.Text = row.Cells[3].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "$('#productModal').modal('show');", true);
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            lblProductID.Text = lblProductID.Text;
            lblProductName.Text = lblProductName.Text;
            lblProductPrice.Text = lblProductPrice.Text;
            txtQuantity.Text = txtQuantity.Text;

            SalesAddProduct();
            GridViewSales.DataBind();
            SalesGetTotalAmount();
        }

        void SalesAddProduct()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EcoBase"].ConnectionString);
            SqlCommand cmd = new SqlCommand("spSalesAddProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SalesID", lblSalesID.Text);
            cmd.Parameters.AddWithValue("@ProductID", lblProductID.Text);
            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblMessage1.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            txtQuantity.Text = "1";
        }

        void SalesGetTotalAmount()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EcoBase"].ConnectionString);
            SqlCommand cmd = new SqlCommand("spSalesGetTotalAmount", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SalesID", lblSalesID.Text);

            try
            {
                conn.Open();
                totalAmount = (double)cmd.ExecuteScalar();
                lblTotalAmountSales.Text = "RM " + totalAmount.ToString("N2");
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        void SalesConfirm()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EcoBase"].ConnectionString);
            SqlCommand cmd = new SqlCommand("spSalesConfirm", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SalesID", lblSalesID.Text);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessage2.Text = "Payment Confirmed!";
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            txtQuantity.Text = "1";
        }

        void DisplayInvoice()
        {
            double serviceTax, amountAfterTax, amountRounded, rounding;
            serviceTax = totalAmount * 0.06;
            amountAfterTax = totalAmount + serviceTax;
            amountRounded = Math.Round((amountAfterTax) / 0.05) * 0.05;
            rounding = amountRounded - amountAfterTax;

            lblTotalAmount.Text = "Total Amount: RM " + totalAmount.ToString("N2");
            lblServiceTax.Text = "Service Tax (6%): RM " + serviceTax.ToString("N2");
            lblAmountAfterTax.Text = "Amount After Tax: RM " + amountAfterTax.ToString("N2");
            lblRounding.Text = "Rounding: RM " + rounding.ToString("N2");
            lblAmountRounded.Text = "Amount Rounded: RM " + amountRounded.ToString("N2");
        }

        void clearAll()
        {
            lblProductID.Text = "";
            lblProductName.Text = "";
            lblProductPrice.Text = "";
            lblTotalAmountSales.Text = "RM 0.00";
            lblTotalAmount.Text = "RM 0.00";
            lblServiceTax.Text = "";
            lblAmountAfterTax.Text = "";
            lblRounding.Text = "";
            lblAmountRounded.Text = "";
            lblMessage1.Text = "";
            lblMessage2.Text = "";
        }

        void SalesRemoveNotConfirmed()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EcoBase"].ConnectionString);
            SqlCommand cmd = new SqlCommand("spSalesRemoveNotConfirmed", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SalesID", lblSalesID.Text);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewProduct.PageIndex = 0;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SalesConfirm();
            DisplayInvoice();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            clearAll();
            GenerateSalesId();
            ddlCategory.DataBind();
            GridViewProduct.PageIndex = 0;
            GridViewProduct.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SalesRemoveNotConfirmed();
            clearAll();
            GenerateSalesId();
            ddlCategory.SelectedIndex = 0;
            GridViewProduct.PageIndex = 0;
            GridViewSales.DataBind();
        }
    }
}
