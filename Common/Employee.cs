
namespace CsharpInterview.Common
{
    public  class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Salary { get; set; }

        public List<Employee> employees { get; set; }=new List<Employee>();
    }
}
