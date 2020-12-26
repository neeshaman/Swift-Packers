package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.UserBean;
import com.SwiftPackers.bean.Vendor_detailBean;
import com.SwiftPackers.dao.UserDao;
import com.SwiftPackers.dao.Vendor_detailDao;

public class ShowVenProfileServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");

		UserDao udao = new UserDao();
		UserBean ubean= udao.getDataByPk(userId);

		Vendor_detailDao vdao = new Vendor_detailDao();
		Vendor_detailBean vbean= vdao.getDataByUserId(userId);

		
		RequestDispatcher rd = null;
		if (vbean == null || ubean==null) {
			rd = request.getRequestDispatcher("Error.jsp");
		} 
		else
		{
			rd = request.getRequestDispatcher("profile_vendor.jsp");
			System.out.println("BEAN DATA" +  ubean);
			request.setAttribute("UserBean", ubean);
			request.setAttribute("Vendor_detailBean", vbean);
		}
		rd.forward(request, response);
	}
}