package com.test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionCommonAP {

	static Connection commonconnection=null;
	private DBConnectionCommonAP()
	{
		
	}
	
	public static Connection getCommonAPConnection()
	{
		try
		{
		Class.forName("org.postgresql.Driver");
		commonconnection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/GDS", "postgres","postgres");
		
		}
		catch(Exception e)
		{
			
		}
		return commonconnection;
	}
	
	public static Connection getCommonAPConnection(String distcode)
	{
		try
		{
		Class.forName("org.postgresql.Driver");
		commonconnection = DriverManager.getConnection("jdbc:postgresql://10.10.5.201:5432/epdsap"+distcode+"", "postgres","epds@123");
	//	commonconnection = DriverManager.getConnection("jdbc:postgresql://10.160.19.145:5433/epdsap"+distcode+"", "postgres","epds@123");
		System.out.println(commonconnection);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return commonconnection;
	}
	
	/*public static void main(String args[])
	{
		getCommonAPConnection("547");
	}*/

}
