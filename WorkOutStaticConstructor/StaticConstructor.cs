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

    public static class StaticClassTest
    {
        // public int instanceData = 10; // This line would cause a compile-time error
        public static int staticData = 30;
        public static readonly int staticReadOnlyData;
        public const int constantData = 50;
    }
}
