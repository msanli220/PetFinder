using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUserTypes.Items.Add("Choose...");
                ddlUserTypes.Items.Add("User");
                ddlUserTypes.Items.Add("Veterinary");
            }
        }

        public void clear()
        {
            ddlUserTypes.SelectedIndex = 0;
            txtName.Text = "";
            txtSurname.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtPhoneNumber.Text = "";
            txtAge.Text = "";
            ddlGender.SelectedIndex = 0;
            txtAddress.Text = "";
            txtCity.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            USERS u = (from x in db.USERS
                       where x.emailAddress == txtEmail.Text
                       select x).SingleOrDefault();

            if (u == null)
            {
                VETS v = (from x in db.VETS
                          where x.emailAddress == txtEmail.Text
                          select x).SingleOrDefault();

                if (v == null)
                {

                    if (ddlUserTypes.SelectedValue == "User")
                    {
                        USERS newUser = new USERS();
                        newUser.name = txtName.Text;
                        newUser.surname = txtSurname.Text;
                        newUser.emailAddress = txtEmail.Text;
                        newUser.password = txtPassword.Text;
                        newUser.phoneNumber = txtPhoneNumber.Text;
                        newUser.age = Convert.ToInt32(txtAge.Text);
                        newUser.gender = ddlGender.SelectedValue;
                        newUser.address = txtAddress.Text;
                        newUser.city = txtCity.Text;
                        fuImage.SaveAs(Server.MapPath("~/Photos/" + fuImage.FileName));
                        newUser.photoURL = "~/Photos/" + fuImage.FileName;
                        newUser.isActive = true;
                        newUser.approvalSituation = false;
                        db.USERS.Add(newUser);
                        db.SaveChanges();
                    }

                    else if (ddlUserTypes.SelectedValue == "Veterinary")
                    {
                        VETS newVet = new VETS();
                        newVet.name = txtName.Text;
                        newVet.surname = txtSurname.Text;
                        newVet.emailAddress = txtEmail.Text;
                        newVet.password = txtPassword.Text;
                        newVet.phoneNumber = txtPhoneNumber.Text;
                        newVet.age = Convert.ToInt32(txtAge.Text);
                        newVet.gender = ddlGender.SelectedValue;
                        newVet.address = txtAddress.Text;
                        newVet.city = txtCity.Text;
                        fuImage.SaveAs(Server.MapPath("~/Photos/" + fuImage.FileName));
                        newVet.photoURL = "~/Photos/" + fuImage.FileName;
                        newVet.isActive = true;
                        newVet.approvalSituation = false;
                        db.VETS.Add(newVet);
                        db.SaveChanges();
                    }

                    lblMessage.Visible = true;
                    lblMessage.Text = "Your information has been successfully saved.";

                    clear();
                }

                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Your e-mail registered already !";
                }
            }

            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Your e-mail registered already !";
            }
        }
    }
}