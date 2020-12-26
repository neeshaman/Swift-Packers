package com.SwiftPackers.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SwiftPackers.bean.H_AnimalBean;
import com.SwiftPackers.bean.H_FoodBean;
import com.SwiftPackers.bean.H_HouseholdBean;
import com.SwiftPackers.bean.H_Office_removalsBean;
import com.SwiftPackers.bean.H_VehicleBean;
import com.SwiftPackers.bean.HaulageBean;
import com.SwiftPackers.bean.QuotationBean;
import com.SwiftPackers.bean.UserBean;
import com.SwiftPackers.dao.H_AnimalDao;
import com.SwiftPackers.dao.H_FoodDao;
import com.SwiftPackers.dao.H_HouseholdDao;
import com.SwiftPackers.dao.H_Office_removalsDao;
import com.SwiftPackers.dao.H_VehicleDao;
import com.SwiftPackers.dao.HaulageDao;
import com.SwiftPackers.dao.QuotationDao;

public class Customer2Servlet extends HttpServlet 
{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
			
		String vehicle = request.getParameter("vehicle");
		//String food = request.getParameter("food");
		String household = request.getParameter("household");
		String office = request.getParameter("office");
		//String pets = request.getParameter("pets");
	
		RequestDispatcher rd = null;
		if(vehicle==null && household==null && office==null)
	{
			request.setAttribute("HaulageError","<font color='red'>Please select Hualage Type</font>");
			rd=request.getRequestDispatcher("customer2.jsp");
		}
		else
		{
			System.out.println("vehicle:"+vehicle);
			//System.out.println("food:"+food);
			System.out.println("household:"+household);
			System.out.println("office:"+office);
			//System.out.println("pets:"+pets);
			
			HttpSession session=request.getSession();
			session.setAttribute("vehicle",vehicle);
			//session.setAttribute("food",food);
			session.setAttribute("household",household);
			session.setAttribute("office",office);
			//session.setAttribute("pets",pets);
			
			rd = request.getRequestDispatcher("customer3.jsp");
		}
		
		rd.forward(request, response);
	}
}