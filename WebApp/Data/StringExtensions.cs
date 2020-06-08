using System.Text.RegularExpressions;

namespace WebApp.Data
{
    public enum CaseEnum
    {
        UpperCase,
        LowerCase
    }
    public static class StringExtensions
    {
        public static string ToSnakeCase(this string input, CaseEnum caseEnum = CaseEnum.UpperCase )
        {
            if (string.IsNullOrEmpty(input)) { return input; }

            var startUnderscores = Regex.Match(input, @"^_+");
            var convertedValues = startUnderscores + Regex.Replace(input, @"([a-z0-9])([A-Z])", "$1_$2");
            var casedString = (caseEnum== CaseEnum.UpperCase)? convertedValues.ToUpper() : convertedValues.ToLower();
            return casedString;
                
        }
    }
}
