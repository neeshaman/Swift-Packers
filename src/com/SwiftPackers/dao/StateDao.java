package com.SwiftPackers.dao;


import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;

import java.util.Scanner;

import com.SwiftPackers.bean.StateBean;
import com.SwiftPackers.util.DbConnection;


public class StateDao 
{
	public ArrayList<StateBean> listState() {
		ArrayList<StateBean> list = new ArrayList<StateBean>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from state";
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			StateBean bean = null;
			while (rs.next()) {
				bean = new StateBean();
				bean.setStateId(rs.getString("state_id"));
				bean.setStateName(rs.getString("state_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("error in  list state....");
			e.printStackTrace();
		}

		return list;
	}

	public boolean insertState(StateBean bean) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String insertQ = "insert into State (state_name) values('"+bean.getStateName()+"')";
			System.out.println(insertQ);
			int i = stmt.executeUpdate(insertQ);
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in insert user....");
			e.printStackTrace();
		}

		return flag;
	}

	public static StateBean scanData() {
		StateBean typeBean = new StateBean();
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter state_ID : ");
		typeBean.setStateId(sc.nextLine());
		sc.nextLine();
		System.out.println("Enter state_Name : ");
		typeBean.setStateName(sc.nextLine());
		return typeBean;
	}

	public StateBean getDataByPk(String stateId) {
		StateBean bean = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from State where state_id = " + stateId;
			System.out.println(selectQ);
			rs = stmt.executeQuery(selectQ);
			if (rs.next())
			{
				bean = new StateBean();
				bean.setStateId(rs.getString("state_id"));
				bean.setStateName(rs.getString("state_name"));
			}
		}
		catch (Exception e)
		{
			System.out.println("error in  State:get data by pk....");
			e.printStackTrace();
		}

		return bean;
	}

	public boolean updateState(StateBean bean) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String updateQ = "update state set state_name='" + bean.getStateName()	+"' where state_id = " + bean.getStateId();
			System.out.println(updateQ);
			int i = stmt.executeUpdate(updateQ);
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in update State....");
			e.printStackTrace();
		}

		return flag;

	}
		
	public boolean deleteState(String stateId) {
		boolean flag = false;

		Connection con = null;
		Statement stmt = null;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String deleteQ = "delete from state where state_id = "+stateId;
			System.out.println(deleteQ);
			int i = stmt.executeUpdate(deleteQ);
			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("error in delete state....");
			e.printStackTrace();
		}
		return flag;
	}

}

