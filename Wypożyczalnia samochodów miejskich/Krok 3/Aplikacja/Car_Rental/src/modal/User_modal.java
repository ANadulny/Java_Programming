package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Register_Bean;
import bean.User_bean;
import common_things.DB_Connection;

public class User_modal {
	
	public List<User_bean> give_user_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
			
		List<User_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from uzytkownik";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new User_bean(i, rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
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
	
	public List<User_bean> give_user_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
			
		List<User_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from uzytkownik" + " " + value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new User_bean(i, rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
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
	
	
	public String user_filtr_conditions(User_bean oUB) {
		System.out.println("im here");
		String value = "";
		int flag = 0;
		if( oUB.getId() != 0 || oUB.getName() != null || oUB.getSurename() != null || oUB.getPESEL() != null || oUB.getPhone() != null) {
			if(oUB.getId() != 0) {
				value += "where uzytkownik_ID = " + Integer.toString(oUB.getId());
				flag++;
			}
			if(oUB.getName() != null) {
				if(flag == 0)
					value += "where imie like \"" + oUB.getName() + "\"";
				else
					value += " and imie like \"" + oUB.getName() + "\"";
				flag++;
			}
			if(oUB.getSurename() != null) {
				if(flag == 0)
					value += "where nazwisko like \"" + oUB.getSurename() + "\"";
				else
					value += " and nazwisko like \"" + oUB.getSurename() + "\"";
				flag++;
			}
			if(oUB.getPESEL() != null) {
				if(flag == 0)
					value += "where PESEL like \"" + oUB.getPESEL() + "\"";
				else
					value += " and PESEL like \"" + oUB.getPESEL() + "\"";
				flag++;
			}
			if(oUB.getPhone() != null) {
				if(flag == 0)
					value += "where NrTelefonu like \"" + oUB.getPhone() + "\"";
				else
					value += " and NrTelefonu like \"" + oUB.getPhone() + "\"";
				flag++;
			}
		}
		if( oUB.getId_from() != 0 || oUB.getName_from() != null || oUB.getSurename_from() != null || oUB.getPESEL_from() != null || oUB.getPhone_from() != null) {
			if(oUB.getId_from() != 0) {
				if(flag == 0)
					value += "where uzytkownik_ID between " + Integer.toString(oUB.getId_from()) + " and " + Integer.toString(oUB.getId_to());
				else
					value += " and uzytkownik_ID between " + Integer.toString(oUB.getId_from()) + " and " + Integer.toString(oUB.getId_to());
				flag++;
			}
			if(oUB.getName_from() != null) {
				if(flag == 0)
					value += "where imie between \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				else
					value += " and imie between \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				flag++;
			}
			if(oUB.getSurename_from() != null) {
				if(flag == 0)
					value += "where imie between  \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				else
					value += " and imie between  \"" + oUB.getName_from() + "\" and \"" +  oUB.getName_to() + "\" ";
				flag++;
			}
			if(oUB.getPESEL_from() != null) {
				if(flag == 0)
					value += "where imie between  \"" + oUB.getSurename_from() + "\" and \"" +  oUB.getSurename_to() + "\" ";
				else
					value += " and imie between  \"" + oUB.getSurename_from() + "\" and \"" +  oUB.getSurename_to() + "\" ";
				flag++;
			}
			if(oUB.getPhone_from() != null) {
				if(flag == 0)
					value += "where imie between  \"" + oUB.getPhone_from() + "\" and \"" +  oUB.getPhone_to() + "\" ";
				else
					value += " and imie between  \"" + oUB.getPhone_from() + "\" and \"" +  oUB.getPhone_to() + "\" ";
				flag++;
			}
		}
		
		
		
		return value;
	}
}