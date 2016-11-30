using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_3 {
    public partial class ViewCartPage : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                checkoutBtn.Enabled = false;
                prodListing.DataSource = ShoppingCartManager.Items;
                prodListing.DataBind();

                float subtotal = 0;
                foreach (ShoppingCartItem item in ShoppingCartManager.Items) {
                    float temp = item.Product.Price * item.Quantity;
                    subtotal += temp;
                }
                subtotalText.InnerHtml = "CDN $" + Math.Round(subtotal, 2);
                totalText.InnerHtml = "CDN $ " + Math.Round(subtotal * 1.13, 2);

                if (subtotal > 0) {
                    checkoutBtn.Enabled = true;
                }
            }
        }

        protected void deleteBtn_Click(object sender, EventArgs e) {
            Button btn = (Button)sender;
            ShoppingCartManager.RemoveItem(btn.ToolTip);
            Response.Redirect("ViewCartPage.aspx");
        }

        protected void checkoutBtn_Click(object sender, EventArgs e) {
            using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {
                conn.Open();
                string sql = "";
                foreach (ShoppingCartItem item in ShoppingCartManager.Items) {
                    float subtotal = item.Product.Price * item.Quantity;
                    double total = Math.Round(subtotal * 1.13, 2);
                    sql += "INSERT INTO `sales` (`saleId`, `prodId`, `quantity`, `price`) VALUES (NULL, '" + item.Product.ID + "', '" + item.Quantity + "', '" + total + "');";
                }
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            ShoppingCartManager.Items.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}