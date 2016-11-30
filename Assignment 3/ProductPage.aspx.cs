using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Assignment_3 {
    public partial class ProductPage : System.Web.UI.Page {

        // Initialize product variable for later use
        static Product product = null;

        protected void Page_Load(object sender, EventArgs e) {

            // Initialize database connection
            using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {

                // Open database connection
                conn.Open();

                // Error checking to make sure pageId session variable isn't null
                string id = "1";
                if (Session["pageId"] != null) {
                    id = Session["pageId"].ToString();
                }

                // Prepare SQL statement
                string sql = "SELECT * FROM products WHERE prodId='" + id + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);

                // Execute SQL statement
                MySqlDataReader reader = cmd.ExecuteReader();

                // Read result of query and place it in product variable
                while (reader.Read()) {
                    product = new Product(int.Parse(reader[0].ToString()), reader[1].ToString(), float.Parse(reader[2].ToString()), reader[3].ToString(), reader[4].ToString());
                }

                // Close database connection
                conn.Close();
            }

            // Fill in page elements with product information from product variable
            prodName.InnerHtml = product.Name;
            prodPrice.InnerHtml = "CDN$ " + product.Price;
            prodDesc.InnerHtml = product.Description;
            prodImg.Src = product.Image;
        }

        protected void addToCartBtn_Click(object sender, EventArgs e) {
            int quantity = int.Parse(prodQuantity.Text);
            ShoppingCartItem item = new ShoppingCartItem(product, quantity);
            ShoppingCartManager.AddItem(item);
            Response.Redirect("ViewCartPage.aspx");
        }

        protected void rateBtn_Click(object sender, EventArgs e) {
            Response.Redirect("RatingPage.aspx");
        }
    }
}