package com.SwiftPackers.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.VehicleBean;
import com.SwiftPackers.dao.VehicleDao;

public class UpdateVehicleServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String vehicleId=request.getParameter("vehicleId");
		String vehicleType = request.getParameter("vehicleType");
		String vehicleCategory = request.getParameter("vehicleCategory");
			
		VehicleBean bean = new VehicleBean();
		boolean isError = false;

		VehicleDao dao=new VehicleDao();
		bean=dao.getDataByPk(vehicleId);
		
		bean.setVehicleId(vehicleId);

		if (vehicleType.trim().length() == 0) {
			isError = true;
			request.setAttribute("VehicleTypeError", "<font color='red'>Please Enter Vehicle type</font>");
		}
		else 
		{ 
			int flag=0;
			for(int i=0;i<vehicleType.trim().length();i++)
			{    
				if( (vehicleType.charAt(i)>=33 && vehicleType.charAt(i)<=64) || (vehicleType.charAt(i)>=91 && vehicleType.charAt(i)<=96) || (vehicleType.charAt(i)>=123 && vehicleType.charAt(i)<=126 ))
				{	
					isError = true;
					request.setAttribute("VehicleTypeError", "<font color='red'>Please Enter valid vehicle type</font>");
					flag=1;
					break;
				}
			}
				
			if(flag==0)
			{
				bean.setVehicleType(vehicleType);
				request.setAttribute("VehicleTypeValue", vehicleType);
			}
		}
		
		
		if (vehicleCategory.trim().length() == 0) {
			isError = true;
			request.setAttribute("VehicleCategoryError", "<font color='red'>Please Enter Vehicle Category</font>");
		}
		else 
		{ 
			int flag=0;
			for(int i=0;i<vehicleCategory.trim().length();i++)
			{    
				if( (vehicleCategory.charAt(i)>=33 && vehicleCategory.charAt(i)<=44) || (vehicleCategory.charAt(i)>=46 && vehicleCategory.charAt(i)<=49)|| (vehicleCategory.charAt(i)>=57 && vehicleCategory.charAt(i)<=64)|| (vehicleCategory.charAt(i)>=91 && vehicleCategory.charAt(i)<=96) || (vehicleCategory.charAt(i)>=123 && vehicleCategory.charAt(i)<=126 ))
				{	
					isError = true;
					request.setAttribute("VehicleCategoryError", "<font color='red'>Please Enter valid vehicle category</font>");
					flag=1;
					break;
				}
			}
				
			if(flag==0)
			{
				bean.setVehicleCategory(vehicleCategory);
				request.setAttribute("VehicleCategoryValue", vehicleCategory);
			}
		}
		
				
		RequestDispatcher rd = null;
		if (isError == true)
		{
			request.setAttribute("VehicleBean", bean);
			rd = request.getRequestDispatcher("EditVehicle.jsp");
		} 
		else
		{
			dao = new VehicleDao();
			if (dao.updateVehicle(bean))
			{
				rd = request.getRequestDispatcher("ListVehicleServlet");
			} 
			else
			{
				request.setAttribute("VehicleBean", bean);
				rd = request.getRequestDispatcher("Error.jsp");
			}
		}
		rd.forward(request, response);
	}
}