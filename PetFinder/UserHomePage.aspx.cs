using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class UserHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            USERS loginUser = (USERS)Session["User"];
            lblHeaderName.Text = loginUser.name + " " + loginUser.surname;
            imgUser.ImageUrl = loginUser.photoURL;
            DateTime todayDate = DateTime.Today;

            DatabaseEntities db = new DatabaseEntities();

            ANNOUNCEMENTS[] listOfPastAnnouncements = (from x in db.ANNOUNCEMENTS where x.date < todayDate && x.isActive == true select x).ToArray();

            for (int i = 0; i < listOfPastAnnouncements.Length; i++)
            {
                listOfPastAnnouncements[i].isActive = false;
            }

            db.SaveChanges();
        }

        public class DataBindingProjection
        {
            public int ID { get; set; }
            public DateTime? date { get; set; }
            public string photo { get; set; }
            public string name { get; set; }
            public string situation { get; set; }
            public double? fee { get; set; }
            public string text { get; set; }
            public string type { get; set; }
            public string petClass { get; set; }
            public int? age { get; set; }
            public string gender { get; set; }
            public string address { get; set; }
            public string city { get; set; }
            public string userName { get; set; }
            public string userSurname { get; set; }
            public string userAddress { get; set; }
            public string userMail { get; set; }
            public string userPhone { get; set; }
        }

        protected void btnMyAnnouncements_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            USERS loginUser = (USERS)Session["User"];

            var query = (from a in db.ANNOUNCEMENTS
                         join u in db.USERS on a.userID equals u.userID
                         join p in db.PETS on a.petID equals p.petID
                         where u.userID == loginUser.userID && a.approvalSituation == true && a.isActive == true
                         select new DataBindingProjection
                         {
                             ID = a.announcementID,
                             date = a.date,
                             photo = p.photoURL,
                             name = p.name,
                             type = p.type,
                             petClass = p.petClass,
                             age = p.age,
                             gender = p.gender,
                             situation = a.situation,
                             fee = a.fee,
                             text = a.text,
                             userName = u.name,
                             userSurname = u.surname,
                             userAddress = u.address,
                             userMail = u.emailAddress,
                             userPhone = u.phoneNumber
                         }).ToList();

            grdAnnouncements.DataSource = query;
            grdAnnouncements.DataBind();

            grdAnnouncements.Visible = true;
            grdPets.Visible = false;
            lblAnnouncementsHeader.Visible = true;
            lblPetsHeader.Visible = false;
        }

        protected void btnMyPets_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            USERS loginUser = (USERS)Session["User"];

            var query = (from p in db.PETS
                         join u in db.USERS on p.userID equals u.userID
                         where u.userID == loginUser.userID && p.approvalSituation == true && p.isActive == true
                         select new DataBindingProjection
                         {
                             ID = p.petID,
                             photo = p.photoURL,
                             name = p.name,
                             type = p.type,
                             petClass = p.petClass,
                             age = p.age,
                             gender = p.gender,
                             address = p.address,
                             city = p.city,
                             userName = u.name,
                             userSurname = u.surname
                         }).ToList();

            grdPets.DataSource = query;
            grdPets.DataBind();

            grdPets.Visible = true;
            grdAnnouncements.Visible = false;
            lblPetsHeader.Visible = true;
            lblAnnouncementsHeader.Visible = false;
        }
    }
}