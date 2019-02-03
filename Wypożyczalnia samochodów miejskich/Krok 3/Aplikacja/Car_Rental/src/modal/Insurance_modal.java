package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Insurance_bean;
import bean.User_bean;
import common_things.DB_Connection;

public class Insurance_modal {
	
	public List<Insurance_bean> give_insurance_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Insurance_bean> list = new ArrayList();
		
		try {
			String qurey = "select PakietOchronny_ID, konto.Konto_ID, imie, Nazwisko, DataWaznosci from pakietochronny, konto, uzytkownik where pakietochronny.konto_id = konto.konto_id and uzytkownik.uzytkownik_id = konto.uzytkownik_id";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Insurance_bean(i, rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
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
	
	public List<Insurance_bean> give_insurance_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Insurance_bean> list = new ArrayList();
		
		try {
			System.out.println("Wywolam zmodyfikowana funkcje " + value);
			String qurey = "select PakietOchronny_ID, konto.Konto_ID, imie, Nazwisko, DataWaznosci from pakietochronny, konto, uzytkownik where pakietochronny.konto_id = konto.konto_id and uzytkownik.uzytkownik_id = konto.uzytkownik_id" + value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Insurance_bean(i, rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
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
	
	public String Insurance_filtr_conditions(Insurance_bean iOB) {
		System.out.println("im here in insurances");
		String value = "";
		int flag = 0;
		if( iOB.getInsurance_id() != 0 || iOB.getUser_name() != null || iOB.getUser_surename() != null || iOB.getAccount_id() != 0 || iOB.getExpire_date_tmp() != null) {
			if(iOB.getInsurance_id() != 0) {
				value += " and PakietOchronny_ID = " + Integer.toString(iOB.getInsurance_id());
				flag++;
			}
			if(iOB.getUser_name() != null) {
				value += " and imie like \"" + iOB.getUser_name() + "\"";
				flag++;
			}
			if(iOB.getUser_surename() != null) {
				value += " and nazwisko like \"" + iOB.getUser_surename() + "\"";
				flag++;
			}
			if(iOB.getAccount_id() != 0) {
				value += " and konto.Konto_ID like = " + Integer.toString(iOB.getAccount_id()) + "\"";
				flag++;
			}
			if(iOB.getExpire_date_tmp() != null) {
				iOB.setExpire_date(java.sql.Date.valueOf(iOB.getExpire_date_tmp()));
				value += " and DataWaznosci = \'" + iOB.getExpire_date() + "\'";
				flag++;
			}
		}
		if( iOB.getInsurance_id_from() != 0 || iOB.getUser_name_from() != null || iOB.getUser_surename_from() != null || iOB.getAccount_id_from() != 0 || iOB.getExpire_date_from_tmp() != null) {
			if(iOB.getInsurance_id_from() != 0) {
				value += " and PakietOchronny_ID between " + Integer.toString(iOB.getInsurance_id_from()) + " and " + Integer.toString(iOB.getInsurance_id_to());
				flag++;
			}
			if(iOB.getUser_name_from() != null) {
				value += " and imie between \"" + iOB.getUser_name_from() + "\" and \"" +  iOB.getUser_name_to() + "\" ";
				flag++;
			}
			if(iOB.getUser_surename_from() != null) {
				value += " and nazwisko between  \"" + iOB.getUser_surename_from() + "\" and \"" +  iOB.getUser_surename_to() + "\" ";
				flag++;
			}
			if(iOB.getAccount_id_from() != 0) {
				value += " and konto.Konto_ID between  " + Integer.toString(iOB.getAccount_id_from()) + " and " +  Integer.toString(iOB.getAccount_id_to());
				flag++;
			}
			if(iOB.getExpire_date_from_tmp() != null) {
				iOB.setExpire_date_from(java.sql.Date.valueOf(iOB.getExpire_date_from_tmp()));
				iOB.setExpire_date_to(java.sql.Date.valueOf(iOB.getExpire_date_to_tmp()));
				value += " and DataWaznosci between  \'" + iOB.getExpire_date_from() + "\' and \'" +  iOB.getExpire_date_to() + "\' ";
				flag++;
			}
		}
		
		System.out.println(value);
		
		
		return value;
	}
}