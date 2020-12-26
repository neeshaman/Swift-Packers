package com.SwiftPackers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.SwiftPackers.bean.Vendor_detailBean;
import com.SwiftPackers.util.DbConnection;

public class Vendor_detailDao 
{
	public boolean insertVendor_detail(Vendor_detailBean bean) 
	{
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try
		{
			con = DbConnection.getConnection(); 
			stmt = con.createStatement();
			//String license = bean.getLicense();
			
			String insertQ = "insert into public.vendor_detail (User_id,Address,City,Max_vehicle,License,Company_name) values ("+bean.getUserId()+",'"+bean.getAddress()+"','"+bean.getCity()+"',"+bean.getMaxVehicle()+",'"+bean.getLicense()+"','"+bean.getCompanyName()+"')";
			System.out.println(insertQ);
			int i = stmt.executeUpdate(insertQ);
			
//			String Q = "INSERT INTO vendor_detail(user_id, address, city, max_vehicle, license, company_name) values(?, ?, ?, ?, ?, ?)";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(bean.getUserId()));
//			preparedStatement.setString(2, bean.getAddress());
//			preparedStatement.setInt(4, Integer.parseInt(bean.getMaxVehicle()));
//			preparedStatement.setString(5, bean.getLicense());
//			preparedStatement.setString(6, bean.getCompanyName());
//			preparedStatement.setString(3, bean.getCity());
//			int i = preparedStatement.executeUpdate();
			
			if (i == 1)
			{
				flag = true;
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in insert vendor_detail....");	
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<Vendor_detailBean> listVendor_detail() 
	{
		ArrayList<Vendor_detailBean> list = new ArrayList<Vendor_detailBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try
		{
			con = DbConnection.getConnection();
			
			stmt = con.createStatement();
			String selectQ = "select * from public.vendor_detail";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			
			Vendor_detailBean bean = null;
			
//			String Q = "SELECT * FROM vendor_detail";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			rs = preparedStatement.executeQuery();
			
			while (rs.next())
			{
				bean = new Vendor_detailBean();
				bean.setVendorDetailId(rs.getString("vendor_detail_id"));
				bean.setUserId(rs.getString("user_id"));
				bean.setAddress(rs.getString("address"));
				bean.setCity(rs.getString("city"));
				bean.setLicense(rs.getString("license"));
				bean.setMaxVehicle(rs.getString("max_vehicle"));
				bean.setCompanyName(rs.getString("company_name"));
				list.add(bean);
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in  list vendor detail....");
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteVendor_detail(String vendorDetailId) 
	{
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String deleteQ = "delete from public.vendor_detail where vendor_detail_id = " + vendorDetailId;
			System.out.println(deleteQ);
			int i = stmt.executeUpdate(deleteQ);
			
//			String Q = "DELETE FROM vendor_detail WHERE vendor_detail_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(vendorDetailId));
//			int i = preparedStatement.executeUpdate();
			
			if (i == 1)
			{
				flag = true;
			}
		} 
		catch (Exception e) 
		{
			System.out.println("error in delete vendor Detail....");
			e.printStackTrace();
		}
		return flag;
	}

	
	public Vendor_detailBean getDataByPk(String vendorDetailId) 
	{
		Vendor_detailBean bean = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from public.vendor_detail where vendor_detail_id = " + vendorDetailId;
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			
//			String Q = "SELECT * FROM vendor_detail WHERE vendor_detail_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(vendorDetailId));
//			rs = preparedStatement.executeQuery();
			
			if (rs.next()) 
			{
				bean = new Vendor_detailBean();
				bean.setVendorDetailId(rs.getString("vendor_detail_id"));
				bean.setUserId(rs.getString("user_id"));
				bean.setAddress(rs.getString("address"));
				bean.setCity(rs.getString("city"));
				bean.setLicense(rs.getString("license"));
				bean.setMaxVehicle(rs.getString("max_vehicle"));
				bean.setCompanyName(rs.getString("company_name"));
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in  vendor_detail::get data by pk....");
			e.printStackTrace();
		}
		return bean;
	}


	public Vendor_detailBean getDataByUserId(String userId) 
	{
		Vendor_detailBean bean = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from public.vendor_detail where user_id = " + userId;
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			
			
//			String Q = "SELECT * FROM vendor_detail WHERE user_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(userId));
//			rs = preparedStatement.executeQuery();
			
			if (rs.next()) 
			{
				bean = new Vendor_detailBean();
				bean.setVendorDetailId(rs.getString("vendor_detail_id"));
				bean.setUserId(rs.getString("user_id"));
				bean.setAddress(rs.getString("address"));
				bean.setCity(rs.getString("city"));
				bean.setLicense(rs.getString("license"));
				bean.setMaxVehicle(rs.getString("max_vehicle"));
				bean.setCompanyName(rs.getString("company_name"));
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in  vendor_detail::get data by userId....");
			e.printStackTrace();
		}
		return bean;
	}

	
	
	
	public boolean updateVendor_detail(Vendor_detailBean bean) 
	{
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
	
			String updateQ = "update public.vendor_detail set user_id=" + bean.getUserId() + " , address='" + bean.getAddress()
					+ "',city='"+bean.getCity()+"', max_vehicle = " +bean.getMaxVehicle()+ " , license = '" + bean.getLicense()
					+ "',company_name='"+bean.getCompanyName()+"' where vendor_detail_id = " + bean.getVendorDetailId();
			System.out.println(updateQ);
			int i = stmt.executeUpdate(updateQ);
			
//			String Q = "UPDATE vendor_detail SET user_id = ?, address = ? , city= ? , max_vehicle  = ?, license = ?, company_name = ?, WHERE vendor_detail_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(bean.getUserId()));
//			preparedStatement.setString(2, bean.getAddress());
//			preparedStatement.setString(3, bean.getCity());
//			preparedStatement.setInt(4, Integer.parseInt(bean.getMaxVehicle()));
//			preparedStatement.setString(5, bean.getLicense());
//			preparedStatement.setString(6, bean.getCompanyName());
//			preparedStatement.setInt(7, Integer.parseInt(bean.getVendorDetailId()));
//			int i  = preparedStatement.executeUpdate();
			
			if (i == 1) 
			{
				flag = true;
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in update vendor_detail....");
			e.printStackTrace();
		}
		return flag;
	}
}