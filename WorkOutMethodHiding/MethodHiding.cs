namespace CsharpInterview.WorkOutMethodHiding
{

    public class MethodHidingBaseClass
    {
        public virtual void print()
        {
            Console.WriteLine("Base class print method");
        }
    }

    public class MethodHidingDerivedClass : MethodHidingBaseClass
    {
        public new void print()
        {
            Console.WriteLine("Derived class print method");
        }


    }
}
