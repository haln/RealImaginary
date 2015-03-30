using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class House
{
    //Constructor with evaluation
    public House(String houseID, String address, String askPrice, String picture, String buildingType,
        String sqrFeet, String propSqrFeet, String beds, String baths, String age, String features)
	{
        this.houseID = houseID;
        this.address = address;
        this.askPrice = askPrice;
        this.picture = "HousePictures/" + houseID + "/" + picture;
        this.buildingType = buildingType;
        this.sqrFeet = sqrFeet;
        this.propSqrFeet = propSqrFeet;
        this.beds = beds;
        this.baths = baths;
        this.age = age;
        this.features = features;
	}
    //Constructor for no evaluation
    public House(String houseID, String address, String askPrice, String picture)
    {
        this.houseID = houseID;
        this.address = address;
        this.askPrice = askPrice;
        this.picture = "HousePictures/" + houseID + "/" + picture;
        buildingType = "To be determined";
        sqrFeet = "To be determined";
        propSqrFeet = "To be determined";
        beds = "To be determined";
        baths = "To be determined";
        age = "To be determined";
        features = "To be determined";
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