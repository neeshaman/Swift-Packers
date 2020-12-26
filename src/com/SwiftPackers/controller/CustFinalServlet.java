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

public class CustFinalServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserBean userBean = (UserBean) session.getAttribute("UserBean");
		String userId = userBean.getUserId();
		
		//boolean isError = false;
		
		QuotationDao Qdao=new QuotationDao();
		ArrayList<QuotationBean> list=Qdao.getCustPendingQuotation(userId);
		ArrayList<QuotationBean> list1=Qdao.getCustApprovedQuotation(userId);
		ArrayList<QuotationBean> list2=Qdao.getCustDeliveredQuotation(userId);

		//request.setAttribute("haul_id", haul_id);
		request.setAttribute("VendorQuotation", list);
		request.setAttribute("ApprovedQuotation", list1);
		request.setAttribute("DeliveredQuotation", list2);
		RequestDispatcher rd = null;
			rd = request.getRequestDispatcher("custFinal.jsp");
		rd.forward(request, response);
	}
}