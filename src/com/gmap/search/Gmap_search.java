/*package com.gmap.search;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.websystique.springmvc.model.Gmap_Model;

public class Gmap_search {

	public static   List<Gmap_Model> getGmap_Data(String Query) throws IOException, ParseException {
		
		List<Gmap_Model> list_Data=new ArrayList<Gmap_Model>();
		String url_qry="https://maps.googleapis.com/maps/api/place/textsearch/json?query=Colleges&location=16.5062,80.6480&radius=0&key=AIzaSyAohX3Oyo_v6y9YXoG80we44t144PpEf8Q";
		 URL url = new URL(url_qry); 
		 String inline="";
		 HttpURLConnection conn = (HttpURLConnection)url.openConnection(); 

		 conn.setRequestMethod("GET"); 
		 conn.connect(); 
		 int responsecode = conn.getResponseCode(); 

		 if(responsecode != 200)
			 throw new RuntimeException("HttpResponseCode: "  +responsecode);
			 else
			 {
			     
			 

				 System.out.println(responsecode);

		 Scanner sc = new Scanner(url.openStream());
		
		 while(sc.hasNext())
		 {
		 inline+=sc.nextLine();
		 }
		 System.out.println("\nJSON data in string format");
		 System.out.println(inline);
		 sc.close();
			 }
		 
		 
		 
		
		 JSONParser parse = new JSONParser();
		 
		 JSONObject jobj = (JSONObject)parse.parse(inline);
		
		 JSONArray jsonarr_1 = (JSONArray) jobj.get("results");
		 list_Data.clear();
		 for(int i=0;i<jsonarr_1.size();i++)
		 {
			 
			 Gmap_Model gsm=new Gmap_Model();
		  
		   JSONObject jsonobj_1 = (JSONObject)jsonarr_1.get(i);
		  
		   
		   JSONObject geometry_obj = (JSONObject) jsonobj_1.get("geometry");
		   
		   JSONObject location_obj=  (JSONObject) geometry_obj.get("location");
		   Double lat=(Double) location_obj.get("lat");
		   Double lan=(Double) location_obj.get("lng");
		   gsm.setLatitude(lat);
		   gsm.setLongitude(lan);
		   JSONObject viewport_obj=   (JSONObject) geometry_obj.get("viewport");
		   
		   JSONObject northeast_obj=   (JSONObject) viewport_obj.get("northeast");
		   
		   JSONObject southwest_obj=   (JSONObject) viewport_obj.get("southwest");

		   
		   Double northeast_obj_lat=(Double) northeast_obj.get("lat");
		   Double northeast_obj_lan=(Double) northeast_obj.get("lng");

		   Double southwest_obj_lat=(Double) southwest_obj.get("lat");
		   Double southwest_obj_lan=(Double) southwest_obj.get("lng");
		   
		   gsm.setNortheast_latitude(northeast_obj_lat);
		   gsm.setNortheast_longitude(northeast_obj_lan);
		   
		   gsm.setSouthwest_latitude(southwest_obj_lat);
		   gsm.setSouthwest_longitude(southwest_obj_lan);
		   
		
		
		
		
		String id=(String) jsonobj_1.get("id");
		String place_id=(String) jsonobj_1.get("place_id");
		String icon=(String) jsonobj_1.get("icon");
		String name=(String) jsonobj_1.get("name");
		String reference=(String) jsonobj_1.get("reference");
		
		String rating=jsonobj_1.get("rating")+"";
		
		Long user_ratings_total=(Long) jsonobj_1.get("user_ratings_total");
		
		
		
		gsm.setId(id);
		gsm.setIcon(icon);
		gsm.setName(name);
		gsm.setPlace_id(place_id);
		gsm.setReference(reference);
		gsm.setRating(Double.valueOf(rating));
		gsm.setUser_ratings_total(user_ratings_total);
		
		
		

	//	String types[]=(String[]) jsonobj_1.get("types");
		
		   JSONArray photos_jsonarry = (JSONArray) jsonobj_1.get("photos");
		   
		   if(photos_jsonarry!=null)
		   {
		   for(int j=0;j<photos_jsonarry.size();j++)
		   {
		      
		      JSONObject jsonobj_2 = (JSONObject) photos_jsonarry.get(j);
		      
		      String photo_reference = (String) jsonobj_2.get("photo_reference");
		      
		      Long height = (Long) jsonobj_2.get("height");
		      Long width = (Long) jsonobj_2.get("width");
		      gsm.setPhoto_reference(photo_reference);
		      gsm.setHeight(height);
		      gsm.setWidth(width);
		   }
		   }
		   list_Data.add(gsm);
		 }
		 System.out.println("list_Data"+list_Data.size());
return list_Data;
	}
public static void main(String[] args) throws IOException, ParseException	
{
	getGmap_Data(null);
}

}
*/