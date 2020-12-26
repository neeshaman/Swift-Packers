package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.dao.AnimalDao;
import com.SwiftPackers.dao.HouseholdDao;
import com.SwiftPackers.dao.UserDao;
import com.SwiftPackers.dao.VehicleDao;
import com.SwiftPackers.dao.Vendor_detailDao;

public class DeleteVehicleServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String vehicleId = request.getParameter("vehicleId");

		VehicleDao dao = new VehicleDao();
		if (dao.deleteVehicle(vehicleId))
		{
			response.sendRedirect("ListVehicleServlet");
		}
		else 
		{
			response.sendRedirect("Error.jsp");
		}
	}
}