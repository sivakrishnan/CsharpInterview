


namespace CsharpInterview.LogicalProgam
{
    public class LogicalPrograms
    {
        string InputString = string.Empty;
        int[] intArray = { 1, 2, 3, 4, 5 };
        int SumOfDigit = 12345;

        int[] arrFirstAndLastInSqureBraces = { 1, 2, 3, 4, 5 };
        public LogicalPrograms()
        {


        }
        public LogicalPrograms(string inputString)
        {
            InputString=inputString;
        }

        public void NumberOfOccurenceOfEachChar()
        {
            var data = InputString.ToCharArray().AsEnumerable().GroupBy(x => x).Select(x => new
            {
                CharName = x.Key,
                CharCount = x.Count()
            });

            foreach (var item in data)
            {
                Console.WriteLine($"Character Name- {item.CharName} Character Count- {item.CharCount}");
            }
        }
        public void CheckOpenCloseBracesProper()
        {
            char[] openBraces = { '(', '{', '[' };
            char[] closeBraces = { ')', '}', ']' };

            Stack<char> objStack = new Stack<char>();

            foreach (char currentChar in InputString.ToCharArray())
            {
                char lastOpenChar = default;
                if (openBraces.Contains(currentChar))
                {
                    objStack.Push(currentChar);
                    continue;
                }
                else if (closeBraces.Contains(currentChar))
                {
                    lastOpenChar=objStack.Pop();

                    int openIndex = Array.IndexOf(openBraces, lastOpenChar);
                    int closeIndex = Array.IndexOf(closeBraces, currentChar);

                    if (openIndex==closeIndex)
                    {
                        continue;
                    }
                    else
                    {
                        Console.WriteLine("Invalid format");
                        return;
                    }
                }
                else
                {
                    continue;
                }

            }

            Console.WriteLine("Valid format");
        }

        public void SumOfDigitFindOut()
        {
            int SumOfDigits = SumOfDigit.ToString().ToCharArray().Sum(x => x-'0');
            Console.WriteLine($"Sum of given Integer {SumOfDigit} is : {SumOfDigits}");
        }

        public void SumOfArrayElements()
        {
            int sum = 0;
            foreach (int i in intArray)
            {
                sum += i;
            }
            Console.WriteLine("sum="+sum.ToString());
        }


        public void FirstAndLastInSqureBraces()
        {
            int firstIndex = 0;
            int lastIndex = arrFirstAndLastInSqureBraces.Length-1;

            for (int i = 0; i<=arrFirstAndLastInSqureBraces.Length/2; i++)
            {
                if (firstIndex==lastIndex)
                {
                    Console.WriteLine($"[{arrFirstAndLastInSqureBraces[firstIndex]}]");
                }
                else
                {
                    Console.WriteLine($"[{arrFirstAndLastInSqureBraces[firstIndex]}, {arrFirstAndLastInSqureBraces[lastIndex]}]");
                }

                firstIndex=firstIndex+1;
                lastIndex=lastIndex-1;
                if (firstIndex>lastIndex)
                {
                    break;
                }
            }
        }
    }
}
