using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpInterview.WorkOutClassHierarchy
{
 
    public class OuterClass
    {
        public void outclassfunction()
        {
            Console.WriteLine("outclassfunction called");
        }

        public class InnerClass
        {
            public void innerclassfunction()
            {
                Console.WriteLine("innerclassfunction called");
            }
        }
    }

}
