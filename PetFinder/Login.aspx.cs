using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
                {
                    txtEmail.Text = Request.Cookies["Email"].Value;
                    txtPassword.Text = Request.Cookies["Password"].Value;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            DatabaseEntities db = new DatabaseEntities();

            USERS u = (from x in db.USERS
                       where x.emailAddress == email && x.password == password && x.approvalSituation == true && x.isActive == true
                       select x).SingleOrDefault();

            if (u == null)
            {
                ADMINISTRATORS a = (from x in db.ADMINISTRATORS
                                    where x.companyEmail == email && x.password == password && x.isActive == true
                                    select x).SingleOrDefault();

                if (a == null)
                {
                    VETS v = (from x in db.VETS
                              where x.emailAddress == email && x.password == password && x.isActive == true
                              select x).SingleOrDefault();

                    if (v == null)
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "Please check your information !";
                    }

                    else
                    {
                        if (cbRememberMe.Checked)
                        {
                            Response.Cookies["Email"].Value = txtEmail.Text;
                            Response.Cookies["Email"].Expires = DateTime.Now.AddHours(8);

                            Response.Cookies["Password"].Value = txtPassword.Text;
                            Response.Cookies["Password"].Expires = DateTime.Now.AddHours(8);
                        }

                        else
                        {
                            if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
                            {
                                Response.Cookies["Email"].Expires = DateTime.Now.AddHours(-1);
                                Response.Cookies["Password"].Expires = DateTime.Now.AddHours(-1);
                            }
                        }

                        Session["Vet"] = v;

                        Application.Lock();
                        Application["Counter"] = Convert.ToInt32(Application["Counter"]) + 1;
                        Application.UnLock();

                        Response.Redirect("VetHomePage.aspx");
                    }
                }

                else
                {
                    if (cbRememberMe.Checked)
                    {
                        Response.Cookies["Email"].Value = txtEmail.Text;
                        Response.Cookies["Email"].Expires = DateTime.Now.AddHours(8);

                        Response.Cookies["Password"].Value = txtPassword.Text;
                        Response.Cookies["Password"].Expires = DateTime.Now.AddHours(8);
                    }

                    else
                    {
                        if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
                        {
                            Response.Cookies["Email"].Expires = DateTime.Now.AddHours(-1);
                            Response.Cookies["Password"].Expires = DateTime.Now.AddHours(-1);
                        }
                    }

                    Session["Admin"] = a;

                    Application.Lock();
                    Application["Counter"] = Convert.ToInt32(Application["Counter"]) + 1;
                    Application.UnLock();

                    Response.Redirect("AdminHomePage.aspx");
                }
            }

            else
            {
                if (cbRememberMe.Checked)
                {
                    Response.Cookies["Email"].Value = txtEmail.Text;
                    Response.Cookies["Email"].Expires = DateTime.Now.AddHours(8);

                    Response.Cookies["Password"].Value = txtPassword.Text;
                    Response.Cookies["Password"].Expires = DateTime.Now.AddHours(8);
                }

                else
                {
                    if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
                    {
                        Response.Cookies["Email"].Expires = DateTime.Now.AddHours(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddHours(-1);
                    }
                }

                Session["User"] = u;

                Application.Lock();
                Application["Counter"] = Convert.ToInt32(Application["Counter"]) + 1;
                Application.UnLock();

                Response.Redirect("UserHomePage.aspx");
            }
        }
    }
}