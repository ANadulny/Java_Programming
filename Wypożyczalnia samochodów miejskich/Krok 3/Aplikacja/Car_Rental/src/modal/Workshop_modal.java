package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.User_bean;
import bean.Workshop_bean;
import common_things.DB_Connection;

public class Workshop_modal {
	
	public List<Workshop_bean> give_workshop_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Workshop_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from warsztat";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Workshop_bean(i, rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
				i++;
              }
              rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	public List<Workshop_bean> give_workshop_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Workshop_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from warsztat "+value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Workshop_bean(i, rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
				i++;
              }
              rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	public String workshop_filtr_conditions(Workshop_bean oUB) {
		String value = "";
		int flag = 0;
		if( oUB.getWorkshop_id() != 0 || oUB.getName() != null || oUB.getZIP_code() != null || oUB.getAdress() != null) {
			if(oUB.getWorkshop_id() != 0) {
				
				value += "where Warsztat_ID = " + Integer.toString(oUB.getWorkshop_id());
				flag++;
				
			}
			if(oUB.getName() != null) {
				if(flag == 0)
					value += "where nazwa like \"" + oUB.getName() + "\"";
				else
					value += " and nazwa like \"" + oUB.getName() + "\"";
				flag++;
			}
			if(oUB.getZIP_code() != null) {
				if(flag == 0)
					value += "where KodPocztowy like \"" + oUB.getZIP_code() + "\"";
				else
					value += " and KodPocztowy like \"" + oUB.getZIP_code() + "\"";
				flag++;
			}
			if(oUB.getAdress() != null) {
				if(flag == 0)
					value += "where adres like \"" + oUB.getAdress() + "\"";
				else
					value += " and adres like \"" + oUB.getAdress() + "\"";
				flag++;
			}
		}
		if( oUB.getWorkshop_id_from() != 0 || oUB.getName_from() != null || oUB.getZIP_code_from() != null || oUB.getAdress_from() != null) {
			if(oUB.getWorkshop_id_from() != 0) {
				if(flag == 0)
					value += "where Warsztat_ID between " + Integer.toString(oUB.getWorkshop_id_from()) + " and " + Integer.toString(oUB.getWorkshop_id_to());
				else
					value += " and Warsztat_ID between " + Integer.toString(oUB.getWorkshop_id_from()) + " and " + Integer.toString(oUB.getWorkshop_id_to());
				flag++;
			}
			if(oUB.getName_from() != null) {
				if(flag == 0)
					value += "where nazwa between \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				else
					value += " and nazwa between \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				flag++;
			}
			if(oUB.getZIP_code_from() != null) {
				if(flag == 0)
					value += "where KodPocztowy between  \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				else
					value += " and KodPocztowy between  \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				flag++;
			}
			if(oUB.getAdress_from() != null) {
				if(flag == 0)
					value += "where adres between  \"" + oUB.getZIP_code_from() + "\" and \"" +  oUB.getZIP_code_to() + "\" ";
				else
					value += " and adres between  \"" + oUB.getZIP_code_from() + "\" and \"" +  oUB.getZIP_code_to() + "\" ";
				flag++;
			}
		}
		
		
		return value;
	}
}