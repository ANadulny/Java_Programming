package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Account_bean;
import common_things.DB_Connection;

public class Account_modal {
	
	public List<Account_bean> give_account_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Account_bean> list = new ArrayList();
		
		try {
			String qurey = "select Konto_ID, Imie, Nazwisko, Srodki, Login, Haslo, AdresEmail, uzytkownik.Uzytkownik_id from konto, uzytkownik where konto.Uzytkownik_id = uzytkownik.Uzytkownik_id";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Account_bean(i, rs.getInt(1),  rs.getString(2),  rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
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
	

	public List<Account_bean> give_account_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Account_bean> list = new ArrayList();

		try {
			String qurey = "select Konto_ID, Imie, Nazwisko, Srodki, Login, Haslo, AdresEmail, uzytkownik.Uzytkownik_id from konto, uzytkownik where konto.Uzytkownik_id = uzytkownik.Uzytkownik_id" + value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Account_bean(i, rs.getInt(1),  rs.getString(2),  rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
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

	public String Account_filtr_conditions(Account_bean oAB) {
		System.out.println("im here ! in account");
		String value = "";
		System.out.println(oAB.getCredit_check());
		int flag = 0;
		if( oAB.getUser_name() != null || oAB.getUser_surename() != null || oAB.getUser_id() != 0 || oAB.getAccount_id() != 0 || oAB.getCredit_check() != null || oAB.getLogin() != null || oAB.getPassword() != null || oAB.getMail() != null) {
			if(oAB.getUser_name() != null) {
				value += " and imie like \"" + oAB.getUser_name() + "\"";
				flag++;
			}
			if(oAB.getUser_surename() != null) {
				value += " and nazwisko like \"" + oAB.getUser_surename() + "\"";
				flag++;
			}
			if(oAB.getUser_id() != 0) {

				value += " and uzytkownik.Uzytkownik_id = " + Integer.toString(oAB.getUser_id());
				flag++;
			}
			if(oAB.getAccount_id() != 0) {
				value += " and konto.Konto_ID = " + Integer.toString(oAB.getAccount_id());
				flag++;
			}
			if(oAB.getCredit_check() != null) {
				value += " and srodki = " + oAB.getCredit_check();
				flag++;
			}
			if(oAB.getLogin() != null) {
				value += " and Login like \"" + oAB.getLogin() + "\"";
				flag++;
			}
			if(oAB.getPassword() != null) {
				value += " and Password like \"" + oAB.getPassword() + "\"";
				flag++;
			}
			if(oAB.getMail() != null) {
				value += " and AdresEmail like \"" + oAB.getMail() + "\"";
				flag++;
			}
		}
		if( oAB.getUser_name_from() != null || oAB.getUser_surename_from() != null || oAB.getUser_id_from() != 0 || oAB.getAccount_id_from() != 0 || oAB.getCredit_from_check() != null || oAB.getLogin_from() != null || oAB.getPassword_from() != null || oAB.getMail_from() != null) {
			if(oAB.getUser_name_from() != null) {
				value += " and imie between \"" + oAB.getUser_name_from() + "\" and \"" + oAB.getUser_name_to() + "\" ";
				flag++;
			}
			if(oAB.getUser_surename_from() != null) {
				value += " and nazwisko between \"" + oAB.getUser_surename_from() + "\" and \"" +  oAB.getUser_surename_to() + "\" ";
				flag++;
			}
			if(oAB.getUser_id_from() != 0) {
				if(flag == 0)
					value += " and uzytkownik.Uzytkownik_id between " + Integer.toString(oAB.getUser_id_from()) + " and " +  Integer.toString(oAB.getUser_id_to());
				flag++;
			}
			if(oAB.getAccount_id_from() != 0) {
				value += " and konto.Konto_ID between " + Integer.toString(oAB.getAccount_id_from()) + " and " +  Integer.toString(oAB.getAccount_id_to());
				flag++;
			}
			if(oAB.getCredit_from_check() != null) {
				value += " and srodki between " + oAB.getCredit_from_check() + " and " +  Integer.toString(oAB.getCredit_to());
				flag++;
			}
			if(oAB.getLogin_from() != null) {
				value += " and Login between  \"" + oAB.getLogin_from() + "\" and \"" +  oAB.getLogin_to() + "\" ";
				flag++;
			}
			if(oAB.getPassword_from() != null) {
				value += " and Password between  \"" + oAB.getPassword_from() + "\" and \"" +  oAB.getPassword_to() + "\" ";
				flag++;
			}
			if(oAB.getMail_from() != null) {
				value += " and AdresEmail between  \"" + oAB.getMail_from() + "\" and \"" +  oAB.getMail_to() + "\" ";
				flag++;
			}
		}


		System.out.println(value);
		return value;
	}
}