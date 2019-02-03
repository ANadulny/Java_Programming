package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Rental_bean;
import bean.User_bean;
import common_things.DB_Connection;

public class Rental_modal {
	
	public List<Rental_bean> give_rental_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Rental_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from wypozyczenie";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Rental_bean(i, rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDate(4), rs.getString(5)));
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
	
	public List<Rental_bean> give_rental_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Rental_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from wypozyczenie "+ value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Rental_bean(i, rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDate(4), rs.getString(5)));
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
	
	public String rental_filtr_conditions(Rental_bean oUB) {
		String value = "";
		int flag = 0;
		if( oUB.getRental_id() != 0 || oUB.getRegister_number() != null || oUB.getStatus() != null || oUB.getRental_date() != null || oUB.getAccount_id() != 0) {
			if(oUB.getRental_id() != 0) {
				value += "where wypozyczenie_ID = " + Integer.toString(oUB.getRental_id());
				flag++;
			}
			if(oUB.getRegister_number() != null) {
				if(flag == 0)
					value += "where NrRejestracyjny like \"" + oUB.getRegister_number() + "\"";
				else
					value += " and NrRejestracyjny like \"" + oUB.getRegister_number() + "\"";
				flag++;
			}
			if(oUB.getStatus() != null) {
				if(flag == 0)
					value += "where status like \"" + oUB.getStatus() + "\"";
				else
					value += " and status like \"" + oUB.getStatus() + "\"";
				flag++;
			}
			if(oUB.getRental_date() != null) {
				if(flag == 0)
					value += "where DataWypozyczenia like \"" + oUB.getRental_date() + "\"";
				else
					value += " and DataWypozyczenia like \"" + oUB.getRental_date() + "\"";
				flag++;
			}
			if(oUB.getAccount_id() != 0) {
				value += "where konto_ID = " + Integer.toString(oUB.getAccount_id());
				flag++;
			}
		}
		if( oUB.getRental_id_from() != 0 || oUB.getRegister_number_from() != null || oUB.getStatus_from() != null || oUB.getRental_date_from() != null || oUB.getAccount_id_from() != 0) {
			if(oUB.getRental_id_from() != 0) {
				if(flag == 0)
					value += "where wypozyczenie_ID between " + Integer.toString(oUB.getRental_id_from()) + " and " + Integer.toString(oUB.getRental_id_to());
				else
					value += " and wypozyczenie_ID between " + Integer.toString(oUB.getRental_id_from()) + " and " + Integer.toString(oUB.getRental_id_to());
				flag++;
			}
			if(oUB.getRegister_number_from() != null) {
				if(flag == 0)
					value += "where NrRejestracyjny between \"" + oUB.getRegister_number_from() + "\" and \"" +  oUB.getRegister_number_to() + "\" ";
				else
					value += " and NrRejestracyjny between \"" + oUB.getRegister_number_from() + "\" and \"" +  oUB.getRegister_number_to() + "\" ";
				flag++;
			}
			if(oUB.getStatus_from() != null) {
				if(flag == 0)
					value += "where status between  \"" + oUB.getRegister_number_from() + "\" and \"" +  oUB.getRegister_number_to() + "\" ";
				else
					value += " and status between  \"" + oUB.getRegister_number_from() + "\" and \"" +  oUB.getRegister_number_to() + "\" ";
				flag++;
			}
			if(oUB.getRental_date_from() != null) {
				if(flag == 0)
					value += "where DataWypozyczenia between  \"" + oUB.getStatus_from() + "\" and \"" +  oUB.getStatus_to() + "\" ";
				else
					value += " and DataWypozyczenia between  \"" + oUB.getStatus_from() + "\" and \"" +  oUB.getStatus_to() + "\" ";
				flag++;
			}
			if(oUB.getAccount_id_from() != 0) {
				if(flag == 0)
					value += "where konto_ID between " + Integer.toString(oUB.getAccount_id_from()) + " and " + Integer.toString(oUB.getAccount_id_to());
				else
					value += " and konto_ID between " + Integer.toString(oUB.getAccount_id_from()) + " and " + Integer.toString(oUB.getAccount_id_to());
				flag++;
		}}
		
		
		
		return value;
	}
}