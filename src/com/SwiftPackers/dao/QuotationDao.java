package com.SwiftPackers.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;

import com.SwiftPackers.bean.QuotationBean;
import com.SwiftPackers.util.DbConnection;

public class QuotationDao
{

	public boolean insertQuotation(QuotationBean bean) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String insertQ = "insert into quotation (quot_price,cust_id,ven_id,haul_id,delivery_date) values ("+bean.getQuotPrice()+","+bean.getCustId()+","+bean.getVenId()+","+bean.getHaulId()+",'"+bean.getDeliveryDate()+"')";
			System.out.println(insertQ);
			int i = stmt.executeUpdate(insertQ);
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in insert quotation....");
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<QuotationBean> listQuotation() {
		ArrayList<QuotationBean> list = new ArrayList<QuotationBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from quotation";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			QuotationBean bean = null;
			while (rs.next())
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  list quotation....");
			e.printStackTrace();
		}

		return list;
	}
	
	
	public ArrayList<QuotationBean> getVenPendingQuotation(String userId) {
		ArrayList<QuotationBean> list = new ArrayList<QuotationBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select quotation.*, public.user.user_name,haulage.haul_id from quotation,public.user,haulage where quotation.ven_id="+userId+" and quotation.is_approved='false' and quotation.cust_id=public.user.user_id and quotation.haul_id=haulage.haul_id and haulage.haul_status='quoted'";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			QuotationBean bean = null;
			while (rs.next())
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
				bean.setUserName(rs.getString("user_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  get Sent quotation....");
			e.printStackTrace();
		}

		return list;
	}
	
	
	
	public ArrayList<QuotationBean> getVenApprovedQuotation(String userId) {
		ArrayList<QuotationBean> list = new ArrayList<QuotationBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from public.haulage, public.quotation, public.user where quotation.ven_id="+userId+" and quotation.is_approved='true' and quotation.haul_id=haulage.haul_id and haul_status='approved' and quotation.cust_id=public.user.user_id";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			QuotationBean bean = null;
			while (rs.next())
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
				bean.setUserName(rs.getString("user_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  get Sent quotation....");
			e.printStackTrace();
		}

		return list;
	}
	
		
	public ArrayList<QuotationBean> getVenDeliveredQuotation(String userId) {
		ArrayList<QuotationBean> list = new ArrayList<QuotationBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from public.haulage, public.quotation, public.user where quotation.ven_id="+userId+" and quotation.is_approved='true' and quotation.haul_id=haulage.haul_id and haulage.haul_status='delivered' and quotation.cust_id=public.user.user_id";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			QuotationBean bean = null;
			while (rs.next())
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
				bean.setUserName(rs.getString("user_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  get Sent quotation....");
			e.printStackTrace();
		}

		return list;
	}
	
	
	
	public ArrayList<QuotationBean> getCustPendingQuotation(String userId) {
		
		ArrayList<QuotationBean> list = new ArrayList<QuotationBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select quotation.*, vendor_detail.*, haulage.haul_title from quotation,vendor_detail,haulage where quotation.cust_id="+userId+" and quotation.is_approved='false' and vendor_detail.user_id = quotation.ven_id and quotation.haul_id=haulage.haul_id";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			QuotationBean bean = null;
			while (rs.next())
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
				bean.setVen_companyName(rs.getString("company_name"));
				bean.setHaulTitle(rs.getString("haul_title"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  get Sent quotation....");
			e.printStackTrace();
		}

		return list;
	}
	
	
	public ArrayList<QuotationBean> getCustApprovedQuotation(String userId) {
		ArrayList<QuotationBean> list = new ArrayList<QuotationBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select quotation.*, vendor_detail.*,haulage.haul_title from quotation,vendor_detail, haulage where quotation.cust_id="+userId+" and quotation.is_approved='true' and vendor_detail.user_id = quotation.ven_id and quotation.haul_id=haulage.haul_id";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			QuotationBean bean = null;
			while (rs.next())
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
				bean.setVen_companyName(rs.getString("company_name"));
				bean.setHaulTitle(rs.getString("haul_title"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  get Sent quotation....");
			e.printStackTrace();
		}

		return list;
	}
	
	
	public ArrayList<QuotationBean> getCustDeliveredQuotation(String userId) {
		ArrayList<QuotationBean> list = new ArrayList<QuotationBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select quotation.* , vendor_detail.company_name,haulage.* from quotation,vendor_detail,haulage where quotation.cust_id="+userId+" and quotation.haul_id=haulage.haul_id and haulage.haul_status='delivered' and vendor_detail.user_id = quotation.ven_id and quotation.is_approved='true'";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			QuotationBean bean = null;
			while (rs.next())
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
				bean.setVen_companyName(rs.getString("company_name"));
				bean.setHaulTitle(rs.getString("haul_title"));
				bean.setHaulStatus(rs.getString("haul_status"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  get Sent quotation....");
			e.printStackTrace();
		}

		return list;
	}
	
	
	
	
	

	public boolean deleteQuotation(String quotId) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String deleteQ = "delete from quotation where quot_id = " + quotId;
			System.out.println(deleteQ);
			int i = stmt.executeUpdate(deleteQ);
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in delete quotation....");
			e.printStackTrace();
		}
		return flag;
	}

	public QuotationBean getDataByPk(String quotId) {
		QuotationBean bean = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from quotation where quot_id = " + quotId;
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			if (rs.next()) 
			{
				bean = new QuotationBean();
				bean.setQuotId(rs.getString("quot_id"));
				bean.setQuotPrice(rs.getString("quot_price"));
				bean.setCustId(rs.getString("cust_id"));
				bean.setVenId(rs.getString("ven_id"));
				bean.setHaulId(rs.getString("haul_id"));
				bean.setDeliveryDate(rs.getString("delivery_date"));
				bean.setIsApproved(rs.getString("is_approved"));
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in  quotation::get data by pk....");
			e.printStackTrace();
		}

		return bean;
	}

	public boolean updateQuotation(QuotationBean bean) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String updateQ = "update quotation set quot_price=" + bean.getQuotPrice() + ", cust_id=" +bean.getCustId()+", ven_id="+bean.getVenId()+ ", haul_id="+bean.getHaulId()+", delivery_date='"+bean.getDeliveryDate()+ "',is_approved='"+bean.getIsApproved()+"' where quot_id = " + bean.getQuotId();
			System.out.println(updateQ);
			int i = stmt.executeUpdate(updateQ);
			if (i == 1) 
			{
				flag = true;
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in update quotation....");
			e.printStackTrace();
		}
		return flag;
	}
	
	
	
	public boolean updateQuotationStatus(String quotId) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String updateQ = "update quotation set is_approved='true' where quot_id = " + quotId;
			System.out.println(updateQ);
			int i = stmt.executeUpdate(updateQ);
			if (i == 1) 
			{
				flag = true;
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in update quotation....");
			e.printStackTrace();
		}
		return flag;
	}
}
