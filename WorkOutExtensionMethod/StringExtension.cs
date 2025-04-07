
namespace CsharpInterview.WorkOutExtensionMethod
{

    public static class StringExtension
    {
        public static string FirstWord(this string str)
        {
            return str.Split(' ').FirstOrDefault()??string.Empty;
        }
    }
}
