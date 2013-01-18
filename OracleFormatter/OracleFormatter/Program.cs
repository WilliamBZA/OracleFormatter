using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace OracleFormatter
{
    class Program
    {
        static void Main(string[] args)
        {
            var parameters = from count in Enumerable.Range(0, args.Length)
                             where args[count].StartsWith("-")
                             select new
                             {
                                 Argument = args[count].ToLowerInvariant(),
                                 FromParameter = args[count + 1].ToLowerInvariant(),
                                 ToParameter = args[count + 2].ToLowerInvariant()
                             };

            var connectParamater = parameters.FirstOrDefault(a => a.Argument == "-connect");
            var nameParameter = parameters.FirstOrDefault(a => a.Argument == "-filename");
            var tableSpaceParameter = parameters.FirstOrDefault(a => a.Argument == "-tablespace");
            var userParameter = parameters.FirstOrDefault(a => a.Argument == "-user");

            var fileContents = string.Concat(File.ReadAllLines(nameParameter.FromParameter).Select(line => line + "\r\n"));

            if (connectParamater != null)
            {
                if (!string.IsNullOrWhiteSpace(connectParamater.ToParameter))
                {
                    fileContents = Replace(fileContents, connectParamater.FromParameter, connectParamater.ToParameter);
                }
                else
                {
                    fileContents = Replace(fileContents, "CONNECT " + connectParamater.FromParameter, string.Empty);
                }
            }

            if (tableSpaceParameter != null)
            {
                if (!string.IsNullOrWhiteSpace(tableSpaceParameter.ToParameter))
                {
                    fileContents = Replace(fileContents, tableSpaceParameter.FromParameter, tableSpaceParameter.ToParameter);
                }
                else
                {
                    fileContents = Replace(fileContents, "TABLESPACE " + tableSpaceParameter.FromParameter, string.Empty);
                }
            }

            if (userParameter != null)
            {
                fileContents = Replace(fileContents, userParameter.FromParameter, userParameter.ToParameter);
            }

            if (nameParameter == null)
            {
                Console.WriteLine("You need to speciy a name");
            }

            File.WriteAllText(nameParameter.ToParameter, fileContents);
        }

        static string Replace(string input, string pattern, string replaceWith)
        {
            return Regex.Replace(input, pattern, replaceWith, RegexOptions.IgnoreCase);
        }
    }
}