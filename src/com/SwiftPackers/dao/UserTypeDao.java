package com.SwiftPackers.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;

import java.util.Scanner;

import com.SwiftPackers.bean.UserTypeBean;
import com.SwiftPackers.util.DbConnection;


public class UserTypeDao 
{
	public ArrayList<UserTypeBean> listUserType() {
		ArrayList<UserTypeBean> list = new ArrayList<UserTypeBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from user_type";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			UserTypeBean bean = null;
			
//			String Q = "SELECT * FROM user_type";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			rs = preparedStatement.executeQuery();
			
			while (rs.next())
			{
				bean = new UserTypeBean();
				bean.setUserTypeId(rs.getString("user_type_id"));
				bean.setUserTypeName(rs.getString("user_type_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  list user_type....");
			e.printStackTrace();
		}

		return list;
	}

	public boolean insertUserType(UserTypeBean bean) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String insertQ = "insert into user_type(user_type_name) values('"+bean.getUserTypeName()+"')";
			System.out.println(insertQ);
			int i = stmt.executeUpdate(insertQ);
			
//			String Q = "INSERT INTO user_type(user_type_name) values(?)";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setString(1, bean.getUserTypeName());
//			int i = preparedStatement.executeUpdate();
			
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in insert user....");
			e.printStackTrace();
		}

		return flag;
	}

	public static UserTypeBean scanData() {
		UserTypeBean typeBean = new UserTypeBean();
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter User_typeID : ");
		typeBean.setUserTypeId(sc.nextLine());
		sc.nextLine();
		System.out.println("Enter User_typeName : ");
		typeBean.setUserTypeName(sc.nextLine());
		return typeBean;
	}
	public UserTypeBean getDataByPk(String userTypeId) {
		UserTypeBean bean = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from user_type where user_type_id = " + userTypeId;
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			
			
//			String Q = "SELECT * FROM user_type WHERE user_type_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(userTypeId));
//			rs = preparedStatement.executeQuery();
			
			
			if (rs.next())
			{
				bean = new UserTypeBean();
				bean.setUserTypeId(rs.getString("user_type_id"));
				bean.setUserTypeName(rs.getString("user_type_name"));
			}
		}
		catch (Exception e)
		{
			System.out.println("error in  Usertype:get data by pk....");
			e.printStackTrace();
		}

		return bean;
	}

	public boolean updateUserType(UserTypeBean bean) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String updateQ = "update user_type set user_type_name='" + bean.getUserTypeName()	+"' where user_type_id = " + bean.getUserTypeId();
			System.out.println(updateQ);
			int i = stmt.executeUpdate(updateQ);
			
//			String Q = "UPDATE user_type set user_type_name = ? WHERE user_type_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setString(1, bean.getUserTypeName());
//			preparedStatement.setInt(2, Integer.parseInt(bean.getUserTypeId()));	
//			int i= preparedStatement.executeUpdate();
//			
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in update user_type....");
			e.printStackTrace();
		}

		return flag;

	}
	
	public boolean deleteUserType(String userTypeId) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String deleteQ = "delete from user_type where user_type_id = "+userTypeId;
			System.out.println(deleteQ);
			
//			String Q = "DELETE FROM user_type WHERE user_type_id = ?";
//			PreparedStatement preparedStatement = con.prepareStatement(Q);
//			preparedStatement.setInt(1, Integer.parseInt(userTypeId));	
//			int i = preparedStatement.executeUpdate();
			
			int i = stmt.executeUpdate(deleteQ);
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in delete user_type....");
			e.printStackTrace();
		}
		return flag;
	}

}
