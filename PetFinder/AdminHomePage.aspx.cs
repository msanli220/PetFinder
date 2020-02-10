using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ADMINISTRATORS loginAdmin = (ADMINISTRATORS)Session["Admin"];
            lblHeaderName.Text = loginAdmin.name + " " + loginAdmin.surname;
            imgAdmin.ImageUrl = loginAdmin.photoURL;
        }

        protected void bntListUsers_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            USERS[] listOfUsers = (from c in db.USERS where c.approvalSituation == true && c.isActive == true select c).ToArray();

            grdUser.DataSource = listOfUsers;
            grdUser.DataBind();

            grdUser.Visible = true;
            grdAppUser.Visible = false;
            grdVet.Visible = false;
            grdAppVet.Visible = false;

            lblUsersHeader.Visible = true;
            lblAppUsersHeader.Visible = false;
            lblVetsHeader.Visible = false;
            lblAppVetsHeader.Visible = false;
        }

        protected void btnAppUsers_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            USERS[] listOfUsers = (from c in db.USERS where c.approvalSituation == false && c.isActive == true select c).ToArray();

            grdAppUser.DataSource = listOfUsers;
            grdAppUser.DataBind();

            grdAppUser.Visible = true;
            grdUser.Visible = false;
            grdVet.Visible = false;
            grdAppVet.Visible = false;

            lblAppUsersHeader.Visible = true;
            lblUsersHeader.Visible = false;
            lblVetsHeader.Visible = false;
            lblAppVetsHeader.Visible = false;
        }

        protected void btnListVets_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            VETS[] listOfVets = (from c in db.VETS where c.approvalSituation == true && c.isActive == true select c).ToArray();

            grdVet.DataSource = listOfVets;
            grdVet.DataBind();

            grdVet.Visible = true;
            grdUser.Visible = false;
            grdAppUser.Visible = false;
            grdAppVet.Visible = false;

            lblVetsHeader.Visible = true;
            lblUsersHeader.Visible = false;
            lblAppUsersHeader.Visible = false;
            lblAppVetsHeader.Visible = false;
        }

        protected void btnAppVets_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            VETS[] listOfVets = (from c in db.VETS where c.approvalSituation == false && c.isActive == true select c).ToArray();

            grdAppVet.DataSource = listOfVets;
            grdAppVet.DataBind();

            grdAppVet.Visible = true;
            grdUser.Visible = false;
            grdAppUser.Visible = false;
            grdVet.Visible = false;

            lblAppVetsHeader.Visible = true;
            lblUsersHeader.Visible = false;
            lblAppUsersHeader.Visible = false;
            lblVetsHeader.Visible = false;
        }

        protected void grdUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)grdUser.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblUserID");
            DatabaseEntities db = new DatabaseEntities();
            int id = Convert.ToInt32(lbldeleteid.Text);

            USERS u = (from x in db.USERS where x.userID == id && x.approvalSituation == true && x.isActive == true select x).SingleOrDefault();
            u.isActive = false;
            db.SaveChanges();

            USERS[] u1 = (from x in db.USERS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdUser.DataSource = u1;
            grdUser.DataBind();
        }


        protected void grdUser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdUser.EditIndex = e.NewEditIndex;

            DatabaseEntities db = new DatabaseEntities();

            USERS[] u = (from x in db.USERS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdUser.DataSource = u;
            grdUser.DataBind();
        }

        protected void grdUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdUser.EditIndex = -1;
            DatabaseEntities db = new DatabaseEntities();

            USERS[] u = (from x in db.USERS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdUser.DataSource = u;
            grdUser.DataBind();
        }

        protected void grdUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = (Label)grdUser.Rows[e.RowIndex].FindControl("lblUserID");
            TextBox name = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtUserName");
            TextBox surname = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtUserSurname");
            TextBox eMailAddress = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox password = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtPassword");
            TextBox phoneNumber = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtPhone");
            TextBox age = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtAge");
            TextBox gender = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtGender");
            TextBox photo = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtPhoto");
            TextBox address = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtAddress");
            TextBox city = (TextBox)grdUser.Rows[e.RowIndex].FindControl("txtCity");
            CheckBox approval = (CheckBox)grdUser.Rows[e.RowIndex].FindControl("checkApproval");

            DatabaseEntities db = new DatabaseEntities();
            int id1 = Convert.ToInt32(id.Text);

            USERS u = (from x in db.USERS where x.approvalSituation == true && x.userID == id1 && x.isActive == true select x).SingleOrDefault();
            u.name = name.Text;
            u.surname = surname.Text;
            u.emailAddress = eMailAddress.Text;
            u.password = password.Text;
            u.phoneNumber = phoneNumber.Text;
            u.age = Convert.ToInt32(age.Text);
            u.gender = gender.Text;
            u.photoURL = photo.Text;
            u.address = address.Text;
            u.city = city.Text;
            u.approvalSituation = approval.Checked;
            db.SaveChanges();

            USERS[] u1 = (from x in db.USERS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdUser.DataSource = u1;
            grdUser.DataBind();
        }


        protected void grdAppUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grdAppUser.SelectedRow;
            int id = Convert.ToInt32(row.Cells[0].Text);

            DatabaseEntities db = new DatabaseEntities();

            USERS[] chosenUser = (from u in db.USERS where u.userID == id && u.isActive == true select u).ToArray();

            chosenUser[0].approvalSituation = true;
            db.SaveChanges();

            USERS[] listOfUsers = (from u in db.USERS where u.approvalSituation == false && u.isActive == true select u).ToArray();

            grdAppUser.DataSource = listOfUsers;
            grdAppUser.DataBind();
        }


        protected void grdVet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)grdVet.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblVetID");
            DatabaseEntities db = new DatabaseEntities();
            int id = Convert.ToInt32(lbldeleteid.Text);

            VETS v = (from x in db.VETS where x.approvalSituation == true && x.vetID == id && x.isActive == true select x).SingleOrDefault();
            v.isActive = false;
            db.SaveChanges();

            VETS[] v1 = (from x in db.VETS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdVet.DataSource = v1;
            grdVet.DataBind();
        }


        protected void grdVet_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdVet.EditIndex = e.NewEditIndex;

            DatabaseEntities db = new DatabaseEntities();

            VETS[] v = (from x in db.VETS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdVet.DataSource = v;
            grdVet.DataBind();
        }

        protected void grdVet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdVet.EditIndex = -1;
            DatabaseEntities db = new DatabaseEntities();

            VETS[] v = (from x in db.VETS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdVet.DataSource = v;
            grdVet.DataBind();
        }

        protected void grdVet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = (Label)grdVet.Rows[e.RowIndex].FindControl("lblVetID");
            TextBox name = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtVetName");
            TextBox surname = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtVetSurname");
            TextBox eMailAddress = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox password = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtPassword");
            TextBox phoneNumber = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtPhone");
            TextBox age = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtAge");
            TextBox gender = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtGender");
            TextBox photo = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtPhoto");
            TextBox address = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtAddress");
            TextBox city = (TextBox)grdVet.Rows[e.RowIndex].FindControl("txtCity");
            CheckBox approval = (CheckBox)grdVet.Rows[e.RowIndex].FindControl("checkApproval");

            DatabaseEntities db = new DatabaseEntities();
            int id1 = Convert.ToInt32(id.Text);

            VETS v = (from x in db.VETS where x.approvalSituation == true && x.vetID == id1 && x.isActive == true select x).SingleOrDefault();
            v.name = name.Text;
            v.surname = surname.Text;
            v.emailAddress = eMailAddress.Text;
            v.password = password.Text;
            v.phoneNumber = phoneNumber.Text;
            v.age = Convert.ToInt32(age.Text);
            v.gender = gender.Text;
            v.photoURL = photo.Text;
            v.address = address.Text;
            v.city = city.Text;
            v.approvalSituation = approval.Checked;
            db.SaveChanges();

            VETS[] v1 = (from x in db.VETS where x.approvalSituation == true && x.isActive == true select x).ToArray();
            grdVet.DataSource = v1;
            grdVet.DataBind();
        }

        protected void grdAppVet_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grdAppVet.SelectedRow;
            int id = Convert.ToInt32(row.Cells[0].Text);

            DatabaseEntities db = new DatabaseEntities();

            VETS[] chosenVet = (from v in db.VETS where v.vetID == id && v.isActive == true select v).ToArray();

            chosenVet[0].approvalSituation = true;
            db.SaveChanges();

            VETS[] listOfVets = (from v in db.VETS where v.approvalSituation == false && v.isActive == true select v).ToArray();

            grdAppVet.DataSource = listOfVets;
            grdAppVet.DataBind();
        }
    }
}