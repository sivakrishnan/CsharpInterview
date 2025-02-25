using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpInterview
{


    class Parent
    {
        public void Print()
        {

            Console.WriteLine("Parent class Method called");

        }

    }
    class Child : Parent

    {

        public void Print()

        {

            Console.WriteLine("Child class Method called");

        }

    }




}

