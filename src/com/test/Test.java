package com.test;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.postgresql.largeobject.LargeObject;
import org.postgresql.largeobject.LargeObjectManager;

public class Test {

	
		
	public static void main(String[] args) throws SQLException
	{
		/*int year = Calendar.getInstance().get(Calendar.YEAR);
System.out.println(year);*/
		
		/*Calendar cal = Calendar.getInstance();
		Date today = cal.getTime();
		cal.add(Calendar.YEAR, 1); // to get previous year add -1
		Date nextYear = cal.getTime();
		System.out.println(nextYear);
		
		*/

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(new java.util.Date());
		
	}
}
