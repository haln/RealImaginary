using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class House
{
	public House(string houseID, string address, string askPrice, string picture, string buildingType,
        string sqrFeet, string propSqrFeet, string beds, string baths, string age, string features)
	{
        this.houseID = houseID;
        this.address = address;
        this.askPrice = askPrice;
        this.picture = picture;
        this.buildingType = buildingType;
        this.sqrFeet = sqrFeet;
        this.propSqrFeet = propSqrFeet;
        this.beds = beds;
        this.baths = baths;
        this.age = age;
        this.features = features;
	}
    public String houseID { get; set; }
    public String address { get; set; }
    public String askPrice { get; set; }
    public String picture { get; set; }
    public String buildingType { get; set; }
    public String sqrFeet { get; set; }
    public String propSqrFeet { get; set; }
    public String beds { get; set; }
    public String baths { get; set; }
    public String age { get; set; }
    public String features { get; set; }
}