namespace App.Models
{
    public class Aula
    {
        public int CompanyId { get; set; }

        public long CreatedAt { get; set; }

        public string Name { get; set; }

        public string Id { get; set; }

        public string Status { get; set; }

        public Summary Summary { get; set; } = null;
    }
}
