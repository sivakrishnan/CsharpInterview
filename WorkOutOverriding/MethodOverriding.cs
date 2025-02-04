

namespace CsharpInterview.WorkOutOverriding
{
    public class MethodOverridingBaseClass
    {
        public virtual void print()
        {
            Console.WriteLine("Base class print method");
        }
    }

    public class MethodOverridingDerivedClass: MethodOverridingBaseClass
    {
        public override void print()
        {
            Console.WriteLine("Derived class print method");
        }
    }
}
