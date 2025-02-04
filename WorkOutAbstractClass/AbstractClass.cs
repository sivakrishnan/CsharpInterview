using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpInterview.WorkOutAbstractClass
{
    public abstract class AbstractClass
    {
        public static int first = 0;

        static AbstractClass()
        {
            first = 100;
            Console.WriteLine("abstract class static constructor");
        }

        public AbstractClass()
        {
            Console.WriteLine("abstract class constructor");
        }
    }

    public class FirstChildAbstractClass : AbstractClass
    {
        static FirstChildAbstractClass()
        {
            Console.WriteLine("First child class static constructor");
        }

        public FirstChildAbstractClass()
        {
            Console.WriteLine("First child class constructor");
        }
    }

    public class SecondChildAbstractClass : FirstChildAbstractClass
    {
        static SecondChildAbstractClass()
        {
            Console.WriteLine("Second child class static constructor");
        }

        public SecondChildAbstractClass()
        {
            Console.WriteLine("Second child class constructor");
        }
    }
}
