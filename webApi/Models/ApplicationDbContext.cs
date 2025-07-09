using Microsoft.EntityFrameworkCore;

namespace Practice.Models
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions option):base(option)
        {
            
        }
        public DbSet<User> users { get; set; }
    }
}
