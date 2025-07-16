

namespace CsharpInterview.WorkOutOverriding
{
    public class MethodOverridingBaseClass
    {
        //private virtual void print() abstract or virtual member can not be private
        public virtual void print()
        {
            Console.WriteLine("Base class print method");
        }
    }

    public class MethodOverridingDerivedClass: MethodOverridingBaseClass
    {
        //private virtual override void print() abstract or virtual member can not be private
        public override void print()
        {
            Console.WriteLine("Derived class print method");
        }
    }
}
