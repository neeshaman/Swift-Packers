package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.dao.HouseholdDao;
import com.SwiftPackers.dao.UserDao;
import com.SwiftPackers.dao.Vendor_detailDao;

public class DeleteHouseholdServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String houseId = request.getParameter("houseId");

		HouseholdDao dao = new HouseholdDao();
		if (dao.deleteHousehold(houseId)) {
			response.sendRedirect("ListHouseholdServlet");
		} else {
			response.sendRedirect("Error.jsp");
		}
	}
}