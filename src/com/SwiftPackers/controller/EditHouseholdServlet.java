package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.HouseholdBean;
import com.SwiftPackers.bean.Vendor_detailBean;
import com.SwiftPackers.dao.HouseholdDao;
import com.SwiftPackers.dao.Vendor_detailDao;

public class EditHouseholdServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String  houseId = request.getParameter("houseId");

		HouseholdDao dao = new HouseholdDao();

		HouseholdBean bean = dao.getDataByPk(houseId);
		RequestDispatcher rd = null;
		if (bean == null) 
		{
			rd = request.getRequestDispatcher("Error.jsp");
		} else 
		{
			rd = request.getRequestDispatcher("EditHousehold.jsp");
			request.setAttribute("HouseholdBean", bean);
		}
		rd.forward(request, response);
	}
}