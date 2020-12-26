package com.SwiftPackers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.HaulageBean;
import com.SwiftPackers.bean.UserBean;
import com.SwiftPackers.dao.HaulageDao;
import com.SwiftPackers.dao.UserDao;

public class EditHaulageServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String haulId = request.getParameter("haulId");

		HaulageDao dao = new HaulageDao();

		HaulageBean bean = dao.getDataByPk(haulId);
		RequestDispatcher rd = null;
		if (bean == null) {
			rd = request.getRequestDispatcher("Error.jsp");
		} else {
			rd = request.getRequestDispatcher("EditHaulage.jsp");
			request.setAttribute("HaulageBean", bean);
		}
		rd.forward(request, response);
	}
}