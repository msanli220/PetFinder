//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PetFinder
{
    using System;
    using System.Collections.Generic;
    
    public partial class ANNOUNCEMENTS
    {
        public int announcementID { get; set; }
        public Nullable<int> petID { get; set; }
        public Nullable<int> userID { get; set; }
        public Nullable<int> vetID { get; set; }
        public string situation { get; set; }
        public Nullable<double> fee { get; set; }
        public string text { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<bool> approvalSituation { get; set; }
        public Nullable<bool> isActive { get; set; }
    
        public virtual PETS PETS { get; set; }
        public virtual USERS USERS { get; set; }
        public virtual VETS VETS { get; set; }
    }
}
