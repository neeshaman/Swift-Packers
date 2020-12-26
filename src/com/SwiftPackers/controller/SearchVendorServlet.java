package com.SwiftPackers.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SwiftPackers.bean.Vendor_detailBean;
import com.SwiftPackers.dao.Vendor_detailDao;

public class SearchVendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SearchVendorServlet() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String vendor_str = request.getParameter("search");

		Vendor_detailDao dao = new Vendor_detailDao();
		ArrayList<Vendor_detailBean> list = dao.searchVendor_detail(vendor_str);
		if(list.size() > 0) request.setAttribute("res", true);
		else request.setAttribute("res", false);
		request.setAttribute("Vendor_detailList", list);
		request.getRequestDispatcher("SearchVendors.jsp").forward(request, response);
		
	}

}
