package com.SwiftPackers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.SwiftPackers.bean.AnimalBean;
import com.SwiftPackers.bean.HouseholdBean;
import com.SwiftPackers.bean.VehicleBean;
import com.SwiftPackers.bean.Vendor_detailBean;
import com.SwiftPackers.util.DbConnection;

public class VehicleDao 
{
	public boolean insertVehicle(VehicleBean bean) 
	{
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String insertQ = "insert into vehicle (vehicle_type,vehicle_category) values ('"+bean.getVehicleType()+"','"+bean.getVehicleCategory()+"')";	
			System.out.println(insertQ);
			int i = stmt.executeUpdate(insertQ);
			
//			String Q = "INSERT INTO vehicle(vehicle_type, vehicle_category) values(?, ?)";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setString(1, bean.getVehicleType());
//			preparedStatement.setString(2, bean.getVehicleCategory());
//			int i = preparedStatement.executeUpdate();
			
			if (i == 1)
			{
				flag = true;
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in insert vehicle....");
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<VehicleBean> listVehicle() 
	{
		ArrayList<VehicleBean> list = new ArrayList<VehicleBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from vehicle";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			VehicleBean bean = null;
			
//			String Q = "SELECT * FROM vehicle";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			rs = preparedStatement.executeQuery();

					
			while (rs.next())
			{
				bean = new VehicleBean();
				bean.setVehicleId(rs.getString("vehicle_id"));
				bean.setVehicleType(rs.getString("vehicle_type"));
				bean.setVehicleCategory(rs.getString("vehicle_category"));
				list.add(bean);
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in  list vehicle....");
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteVehicle(String vehicleId) 
	{
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String deleteQ = "delete from vehicle where vehicle_id = " + vehicleId;
			System.out.println(deleteQ);
			int i = stmt.executeUpdate(deleteQ);
//			
//			String Q = "DELETE FROM vehicle WHERE vehicle_id = ? ";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
// 			preparedStatement.setInt(1, Integer.parseInt(vehicleId));
//			int i = preparedStatement.executeUpdate();
			
			if (i == 1)		
			{
				flag = true;
			}
		} 
		catch (Exception e) 
		{
			System.out.println("error in delete vehicle....");
			e.printStackTrace();
		}
		return flag;
	}

	public VehicleBean getDataByPk(String vehicleId) 
	{
		VehicleBean bean = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from vehicle where vehicle_id = " + vehicleId;
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			
//			String Q = "SELECT * FROM vehicle WHERE vehicle_id = ? ";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(vehicleId));
//			rs = preparedStatement.executeQuery();
			
			if (rs.next()) 
			{
				bean = new VehicleBean();
				bean.setVehicleId(rs.getString("vehicle_id"));
				bean.setVehicleType(rs.getString("vehicle_type"));
				bean.setVehicleCategory(rs.getString("vehicle_category"));
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in  vehicle::get data by pk....");
			e.printStackTrace();
		}
		return bean;
	}

	public boolean updateVehicle(VehicleBean bean) 
	{
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String updateQ = "update vehicle set vehicle_id=" + bean.getVehicleId() + " , vehicle_type='" + bean.getVehicleType()
					+ "' , vehicle_category ='" +bean.getVehicleCategory()+"' where vehicle_id = " + bean.getVehicleId();
			System.out.println(updateQ);
			int i = stmt.executeUpdate(updateQ);
		
//			String Q = "UPDATE vehicle SET vehicle_type = ? , vehicle_category = ? WHERE vehicle_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setString(1, bean.getVehicleType());
//			preparedStatement.setString(2, bean.getVehicleCategory());
//			int i= preparedStatement.executeUpdate();
			
			if (i == 1) 
			{
				flag = true;
			}
		} 
		catch (Exception e)
		{
			System.out.println("error in update vehicle....");
			e.printStackTrace();
		}
		return flag;
	}
}