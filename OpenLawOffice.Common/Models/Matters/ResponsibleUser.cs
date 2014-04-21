﻿namespace OpenLawOffice.Common.Models.Matters
{
    public class ResponsibleUser : Core
    {
        public int? Id { get; set; }

        public Matter Matter { get; set; }

        public Security.User User { get; set; }

        public string Responsibility { get; set; }
    }
}