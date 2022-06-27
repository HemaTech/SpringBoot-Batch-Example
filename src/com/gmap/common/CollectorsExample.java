package com.gmap.common;

import java.util.ArrayList;  
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;   
class Product{  
    int id;  
    @Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + "]";
	}
	String name;  
    float price;  
    public Product(int id, String name, float price) {  
        super();  
        this.id = id;  
        this.name = name;  
        this.price = price;  
    }  
}  
public class CollectorsExample{  
    public static void main(String[] args) {  
        List<Product> list=new ArrayList<Product>();  
        list.add(new Product(1,"Samsung A5",17000f));  
        list.add(new Product(3,"Iphone 6S",65000f));  
        list.add(new Product(2,"Sony Xperia",25000f));  
        list.add(new Product(4,"Nokia Lumia",15000f));  
        list.add(new Product(5,"Redmi4 ",26000f));  
        list.add(new Product(6,"Lenevo Vibe",19000f));  
          
        // using lambda to filter data  
      //  Stream<Product> filtered_data = list.stream().filter(p -> p.price > 20000);  
          
        // using lambda to iterate through collection  
        list.stream().map(p -> p.price+20000).forEach(  
                product -> System.out.println(product)  
        );
        
        list.stream().filter(p -> p.price>20000).forEach(  
                product -> System.out.println(product.name)  
        );
        
        List<Product> listf=     list.stream().filter(p -> p.price>20000).collect(Collectors.toList());
        System.out.println(listf);
        
        
     List<Float> fl=   list.stream().map(p -> p.price+20000).collect(Collectors.toList());
     System.out.println(fl) ;
    }  
}  