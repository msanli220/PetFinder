using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class VetHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VETS loginVet = (VETS)Session["Vet"];
            lblHeaderName.Text = loginVet.name + " " + loginVet.surname;
            imgVet.ImageUrl = loginVet.photoURL;
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
            public string vetName { get; set; }
            public string vetSurname { get; set; }
            public string vetAddress { get; set; }
            public string vetMail { get; set; }
            public string vetPhone { get; set; }
        }

        protected void btnMyAnnouncements_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();

            VETS loginVet = (VETS)Session["Vet"];

            var query = (from a in db.ANNOUNCEMENTS
                         join v in db.VETS on a.vetID equals v.vetID
                         join p in db.PETS on a.petID equals p.petID
                         where v.vetID == loginVet.vetID && a.approvalSituation == true && a.isActive == true
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
                             vetName = v.name,
                             vetSurname = v.surname,
                             vetAddress = v.address,
                             vetMail = v.emailAddress,
                             vetPhone = v.phoneNumber
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

            VETS loginVet = (VETS)Session["Vet"];

            var query = (from p in db.PETS
                         join v in db.VETS on p.vetID equals v.vetID
                         where v.vetID == loginVet.vetID && p.approvalSituation == true && p.isActive == true
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
                             vetName = v.name,
                             vetSurname = v.surname
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