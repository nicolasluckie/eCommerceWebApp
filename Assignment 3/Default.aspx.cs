using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace Assignment_3 {
    public partial class _Default : Page {
        protected void Page_Load(object sender, EventArgs e) {
            List<Product> productList = new List<Product>();

            using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {
                conn.Open();
                string sql = "SELECT * FROM products";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read()) {
                    productList.Add(new Product(int.Parse(reader[0].ToString()), reader[1].ToString(), float.Parse(reader[2].ToString()), reader[3].ToString(), reader[4].ToString()));
                }
                conn.Close();
            }

            product1Name.InnerHtml = productList[0].Name;
            product1Img.Src = productList[0].Image;
            product1Desc.InnerHtml = productList[0].Description;

            product2Name.InnerHtml = productList[1].Name;
            product2Img.Src = productList[1].Image;
            product2Desc.InnerHtml = productList[1].Description;

            product3Name.InnerHtml = productList[2].Name;
            product3Img.Src = productList[2].Image;
            product3Desc.InnerHtml = productList[2].Description;
        }

        protected void viewProductBtn_Click(object sender, EventArgs e) {
            LinkButton btn = (LinkButton)sender;
            string buttonId = btn.ID;
            string[] trim = buttonId.Split('_');
            Session["pageId"] = trim[1];
            Response.Redirect("ProductPage.aspx");
        }
    }
}