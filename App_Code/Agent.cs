using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Agent
{
	public Agent(string name, string phone, string email)
	{
        this.name = name;
        this.phone = phone;
        this.email = email;
	}
    public String name { get; set; }
    public String phone { get; set; }
    public String email { get; set; }
}