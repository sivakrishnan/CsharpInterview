namespace CsharpInterview.WorkOutStaticConstructor
{
    public class StaticConstructor
    {
        static StaticConstructor()
        {
            Console.WriteLine("Static Constructor called");
        }

        public  StaticConstructor()
        {
            Console.WriteLine("Non Static Constructor called");
        }
    }
}
