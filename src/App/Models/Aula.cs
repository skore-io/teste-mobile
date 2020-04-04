using System;

namespace App.Models
{
    public class Aula
    {
        public int CompanyId { get; set; }

        public long CreatedAt { get; set; }

        // COmo o json estava em UnixTimeSeconds, convertendo apenas para exibição e sorting.
        public DateTimeOffset CreationDate
        {
            get => DateTimeOffset.FromUnixTimeSeconds(CreatedAt);
        }

        public string Name { get; set; }

        public string Id { get; set; }

        public string Status { get; set; }

        public Summary Summary { get; set; } = null;
    }
}
