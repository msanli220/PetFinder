using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class Announcements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime todayDate = DateTime.Today;

            DatabaseEntities db = new DatabaseEntities();

            ANNOUNCEMENTS[] listOfPastAnnouncements = (from x in db.ANNOUNCEMENTS where x.date < todayDate && x.isActive == true select x).ToArray();

            for (int i = 0; i < listOfPastAnnouncements.Length; i++)
            {
                listOfPastAnnouncements[i].isActive = false;
            }

            db.SaveChanges();



            var query = (from a in db.ANNOUNCEMENTS
                         join u in db.USERS on a.userID equals u.userID
                         join p in db.PETS on a.petID equals p.petID
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
                             userCity = u.city,
                             userMail = u.emailAddress,
                             userPhone = u.phoneNumber
                         }).ToList();

            grdAnnouncementsUser.DataSource = query;
            grdAnnouncementsUser.DataBind();

            var query2 = (from a in db.ANNOUNCEMENTS
                         join v in db.VETS on a.vetID equals v.vetID
                         join p in db.PETS on a.petID equals p.petID
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
                             vetCity = v.city,
                             vetMail = v.emailAddress,
                             vetPhone = v.phoneNumber
                         }).ToList();

            grdAnnouncementsVet.DataSource = query2;
            grdAnnouncementsVet.DataBind();
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
            public string userName { get; set; }
            public string userSurname { get; set; }
            public string userAddress { get; set; }
            public string userCity { get; set; }
            public string userMail { get; set; }
            public string userPhone { get; set; }
            public string vetName { get; set; }
            public string vetSurname { get; set; }
            public string vetAddress { get; set; }
            public string vetCity { get; set; }
            public string vetMail { get; set; }
            public string vetPhone { get; set; }
        }
    }
}