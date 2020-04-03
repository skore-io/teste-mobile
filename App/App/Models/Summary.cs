namespace App.Models
{
    public class Summary
    {
        public int? Percentage { get; set; }

        public bool HasPercentage => Percentage.HasValue;
    }
}
