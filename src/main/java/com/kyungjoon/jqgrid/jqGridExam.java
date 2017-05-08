package com.kyungjoon.jqgrid;

import java.util.ArrayList;
import java.util.List;
import com.kyungjoon.jqgrid.*;

public class jqGridExam {
	
	
	
	public ActionResult GetJqGridData(String page, String rows, String sidx, String sord)
	{
	    var jqGridData = new JqGridObject()
	    {
	        List resultList = GetSomeSampleData(),
	        Page = page,
	        PageSize = 3, // u can change this !
	        SortColumn = sidx,
	        SortOrder = sord
	    };
	
	    return Json(jqGridData, JsonRequestBehavior.AllowGet);
	}
	
	public List<Fruit> GetSomeSampleData()
	{
		
		List arrList=new ArrayList<>();
	    Fruit fruit=new Fruit(1, "Apple");
	    arrList.add(fruit);
	    fruit=new Fruit(2, "Apple2");
	    arrList.add(fruit);
	    fruit=new Fruit(3, "Apple3");
	    arrList.add(fruit);
	    fruit=new Fruit(4, "Apple4");
	    arrList.add(fruit);
	    fruit=new Fruit(5, "Apple5");
	    arrList.add(fruit);
	    fruit=new Fruit(6, "Apple6");
	    arrList.add(fruit);
	    fruit=new Fruit(7, "Apple7");
	    arrList.add(fruit);
	    fruit=new Fruit(8, "Apple8");
	    arrList.add(fruit);
	    fruit=new Fruit(9, "Apple9");
	    arrList.add(fruit);
	    fruit=new Fruit(10, "Apple10");
	    arrList.add(fruit);
	    
	    System.out.println(fruit);
	    
	    
	    return arrList;
	}
}

