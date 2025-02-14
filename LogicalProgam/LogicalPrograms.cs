using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CsharpInterview.LogicalProgam
{
    public class LogicalPrograms
    {
        string InputString = string.Empty;
        public LogicalPrograms()
        {

        }
        public LogicalPrograms(string inputString)
        {
            InputString=inputString;
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
    }
}
