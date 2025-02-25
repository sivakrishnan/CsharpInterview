

namespace CsharpInterview.WorkOutBasicSingleton
{
    public sealed class BasicSingleton
    {
        private static int Counter = 0;
        private static BasicSingleton instance = new BasicSingleton();

        public static BasicSingleton GetInstance
        {
            get
            {
                return instance;
            }
        }
        private BasicSingleton()
        {
            Counter++;

            Console.WriteLine("Counter value="+Counter.ToString());
        }

        public void PrintDetails(string message)
        {
            Console.WriteLine(message);
        }
    }
}
