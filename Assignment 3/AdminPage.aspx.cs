using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_3 {
    public partial class AdminPage : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                // If no session variable
                if (Session["loggedIn"] == null) {
                    Response.Redirect("Default.aspx");
                    Session["loggedIn"] = false;
                }
                // If session variable, but not logged in
                else {
                    if (bool.Parse(Session["loggedIn"].ToString()) == false) {
                        Response.Redirect("Default.aspx");
                        Session["loggedIn"] = false;
                    }
                    // User authenticated successfully
                    else {
                        string output = "";
                        double nettotal = 0;

                        using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {
                            conn.Open();
                            string sql = "SELECT * FROM sales INNER JOIN products ON sales.prodId=products.prodId ORDER BY saleId ASC";
                            MySqlCommand cmd = new MySqlCommand(sql, conn);
                            MySqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read()) {
                                output += "<tr><td>" + reader[0] + "</td><td>" + reader[5] + "</td><td>" + reader[2] + "</td><td>$ " + reader[6] + "</td></tr>";
                                nettotal += double.Parse(reader[6].ToString());
                            }
                            conn.Close();
                        }
                        salesOutput.InnerHtml = output;
                        salesFooter.InnerHtml = "<tr><td></td><td></td><td><strong>NET TOTAL:</strong></td><td><strong>$ " + nettotal + "</strong></td></tr>";

                        output = "";
                        using (MySqlConnection conn = new MySqlConnection("Server=localhost;Database=asgn3;Uid=root;Pwd=kermit;")) {
                            conn.Open();
                            string sql = "SELECT * FROM ratings INNER JOIN products ON ratings.prodId=products.prodId ORDER BY recordId ASC";
                            MySqlCommand cmd = new MySqlCommand(sql, conn);
                            MySqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read()) {
                                output += "<tr><td>" + reader[0] + "</td><td>" + reader[5] + "</td><td>" + reader[2] + "</td><td>" + reader[3] + "</td></tr>";
                            }
                            conn.Close();
                        }
                        ratingsOutput.InnerHtml = output;
                        /*
                         * sales
                        <tr>
                            <th class="danger">Sale ID</th>
                            <th class="warning">Product Name</th>
                            <th class="success">Quantity</th>
                            <th class="info">Quantity</th>
                        </tr>
                        */
                        /*
                         * ratings
                        <tr><td style="width: 300px;">{ PRODUCT NAME }</td>
                        <td style="width: 150px;">{ RATING }</td>
                        <td style="max-width: 50px; word-break: break-word;">{ COMMENT }</td></tr>
                        */
                    }
                }
            } else {
                Response.Redirect("Default.aspx");
                Session["loggedIn"] = false;
            }
        }
    }
}