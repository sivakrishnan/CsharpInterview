using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpInterview.ToListVsToArray
{
    public class ToListVsToArrays
    {

        public readonly List<int> list1;
        public readonly List<int> list2;

        public  int[] arr1;
        public  int[] arr2;

        public ToListVsToArrays()
        {
            list1=new() { 1, 2, 3, 4 };
            list2=list1.ToList();

            arr1=[ 1, 2, 3];
            arr2=arr1.ToArray();
        }

        public void SomeCheck()
        {
            list1[0]=42;
            Console.WriteLine("Is List1 of 0 and List2 of 0 both are same {0}", (list1[0]==list2[0]).ToString());
            list1.Add(42);
            Console.WriteLine("List 1 length - {0}", list1.Count);
            Console.WriteLine("List 2 length - {0}", list2.Count);

            arr1[0]=42;
            Console.WriteLine("Is Array1 of 0 and Array2 of 0 both are same {0}", (arr1[0]==arr2[0]).ToString());
            arr1= arr1.Append(42).ToArray();
            Console.WriteLine("Array 1 length - {0}", arr1.Length);
            Console.WriteLine("Array 2 length - {0}", arr2.Length);
        }
    }
}
