
namespace CsharpInterview.WorkOutThread
{
    public delegate void SumOfNumbersCallback(int SumOfNumber);
    public class WorkOutThreads
    {
        int _target;
        SumOfNumbersCallback _sumOfNumbersCallback;
        public WorkOutThreads(int target, SumOfNumbersCallback sumOfNumbersCallback)
        {
            _target = target;
            _sumOfNumbersCallback = sumOfNumbersCallback;
        }
        //public static void PrintNumbers()
        //{
        //    for(int i=1;  i<=10; i++)
        //    {
        //        Console.WriteLine(i);
        //    }
        //}
        // pass object is not a good programming practice, this will loose the type safety
        //public static void PrintNumbers(object target)
        //{
        //    int actualTarget= target is null? 0:(int)target;
        //    for (int i = 1; i <= actualTarget; i++)
        //    {
        //        Console.WriteLine(i);
        //    }
        //}

        public void PrintNumbers()
        {
            for (int i = 1; i <= _target; i++)
            {
                Console.WriteLine(i);
            }
        }

        public void PrintSumOfNumbers()
        {
            int sum = 0;
            for (int i = 1; i <= _target; i++)
            {
                sum = sum + i;
            }

            if (_sumOfNumbersCallback != null)
            {
                _sumOfNumbersCallback(sum);
            }
        }
    }
}
