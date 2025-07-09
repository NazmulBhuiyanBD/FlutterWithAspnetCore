using System.ComponentModel.DataAnnotations;

namespace Practice.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set; }
        [Required]
        public string Name { get; set; } = "";
        [Required]
        public string Address { get; set; } = "";
    }
}
