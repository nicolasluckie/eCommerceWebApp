using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_3 {
    public partial class LoginPage : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                if (Session["loggedIn"] != null) {
                    if (bool.Parse(Session["loggedIn"].ToString()) == true) {
                        Response.Redirect("AdminPage.aspx");
                    }
                }
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e) {
            if (username.Text == "admin") {
                if (password.Text == "admin") {
                    Session["loggedIn"] = true;
                    Response.Redirect("AdminPage.aspx");
                }
            }
        }
    }
}