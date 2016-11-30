using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_3 {
    public partial class RatingPage : System.Web.UI.Page {
        
        // Initialize page variables
        public static string productName = "";
        public static int prodId = 1;
        public static List<int> ratings = new List<int>();

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {

                #region Check pageId session variable
                if (Session["pageId"] != null) {
                    prodId = int.Parse(Session["pageId"].ToString());
                }
                #endregion

                #region Pull name from prodId
                // Initialize database connection
                using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {

                    // Open database connection
                    conn.Open();

                    // Error checking to make sure pageId session variable isn't null
                    

                    // Prepare SQL statement
                    string sql = "SELECT prodName, prodId FROM products WHERE prodId='" + prodId + "'";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);

                    // Execute SQL statement
                    MySqlDataReader reader = cmd.ExecuteReader();

                    // Read result of query and place it in product variable
                    while (reader.Read()) {
                        productName = reader[0].ToString();
                        prodId = int.Parse(reader[1].ToString());
                    }

                    // Close database connection
                    conn.Close();
                }

                // Fill in page elements with product information from product variable
                prodName.InnerHtml = productName;
                #endregion

                #region Pull product rating
                // Initialize database connection
                using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {

                    // Open database connection
                    conn.Open();

                    // Prepare SQL statement
                    string sql = "SELECT rating FROM ratings WHERE prodId='" + prodId + "'";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);

                    // Execute SQL statement
                    MySqlDataReader reader = cmd.ExecuteReader();

                    // Read result of query and place it in product variable
                    while (reader.Read()) {
                        ratings.Add(int.Parse(reader[0].ToString()));
                    }

                    // Close database connection
                    conn.Close();
                }

                // Fill in page elements with product information from product variable
                double average = 0;
                foreach (int rating in ratings) {
                    average += rating;
                }
                average = Math.Round(average / ratings.Count, 0);
                currRating.InnerHtml = "Current Rating: " + average;
                #endregion
            }
        }

        protected void submitRating_Click(object sender, EventArgs e) {
            using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {
                conn.Open();
                string sql = "INSERT INTO `ratings` (`recordId`, `prodId`, `rating`, `comment`) VALUES (NULL, '" + prodId + "', '" + int.Parse(prodRating.Text) + "', '" + prodComment.Text + "')";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Redirect("ProductPage.aspx");
        }
    }
}