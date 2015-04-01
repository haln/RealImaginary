using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Results
/// </summary>
public class Result
{
    public Result(string searchString, string bmin, string bmax, string c, string bedr, string bathr, string sft, string proptype)
	{
        searchStr = searchString;
        budgetMin = bmin;
        budgetMax = bmax;
        city = c;
        bedrooms = bedr;
        bathrooms = bathr;
        sqft = sft;
        ptype = proptype;
	}

    public string searchStr { get; set; }
    public string budgetMin { get; set; }
    public string budgetMax { get; set; }
    public string city { get; set; }
    public string bedrooms { get; set; }
    public string bathrooms { get; set; }
    public string sqft { get; set; }
    public string ptype { get; set; }
}