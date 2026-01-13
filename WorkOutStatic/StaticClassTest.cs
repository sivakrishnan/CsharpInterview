namespace CsharpInterview.WorkOutStatic
{
    public interface StaticClassTestInterface
    {
        public void addNumber();
    }

    public class StaticClassInheritance /*: StaticClassTest*/
    {

    }
    public static class StaticClassTest/*: StaticClassTestInterface*/
    {
        //public int i = 0; // should be static
        public static int i;

        static StaticClassTest()
        {
            i=10;
        }
    }

}
