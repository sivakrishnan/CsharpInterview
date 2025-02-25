using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpInterview.WorkOutFunc
{
    public class FuncCheck
    {
        public void FuncWithTwoParameter()
        {
            Func<int, int, int> twoParameter=(a,  b) => a + b;
            Console.WriteLine("twoParameter output-{0}", twoParameter(5, 6));

            Action<string> actionCheck = (str) =>
            {
                Console.WriteLine("print this value={0}", str);
            };

            actionCheck("pls print this");

            Predicate<int> predicateCheck=(value1) =>value1%2==0;
            Console.WriteLine("Check is Even-{0}", predicateCheck(5));
        }
    }
}
