package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Transaction_bean;
import bean.User_bean;
import common_things.DB_Connection;

public class Transaction_modal {
	
	public List<Transaction_bean> give_transaction_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Transaction_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from transakcja";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Transaction_bean(i, rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getTime(4), rs.getTime(5), rs.getInt(6)));
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

	public List<Transaction_bean> give_transaction_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Transaction_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from transakcja "+ value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Transaction_bean(i, rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getTime(4), rs.getTime(5), rs.getInt(6)));
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
	
	public String transaction_filtr_conditions(Transaction_bean oUB) {
		String value = "";
		int flag = 0;
	
		if( oUB.getTransaction_id() != 0 || oUB.getRental_id()!=0 || oUB.getValue() != 0 || oUB.getRental_time() != null || oUB.getStand_time() != null || oUB.getAdditional_costs() != 0) {
			if(oUB.getTransaction_id() != 0) {
				value += "where Transakcja_ID = " + Integer.toString(oUB.getTransaction_id());
				flag++;
			}
			if(oUB.getRental_id() != 0) {
				value += "where wypozyczenie_ID = " + Integer.toString(oUB.getTransaction_id());
				flag++;
			}
			if(oUB.getValue() != 0) {
				if(flag == 0)
					value += "where kwota = " + Integer.toString(oUB.getValue());
				flag++;
			}
			if(oUB.getRental_time() != null) {
				if(flag == 0)
					value += "where CzasWypozyczenia like \"" + oUB.getRental_time() + "\"";
				else
					value += " and CzasWypozyczenia like \"" + oUB.getRental_time() + "\"";
				flag++;
			}
			if(oUB.getStand_time() != null) {
				if(flag == 0)
					value += "where CzasPostoju like \"" + oUB.getStand_time() + "\"";
				else
					value += " and CzasPostoju like \"" + oUB.getStand_time() + "\"";
				flag++;
			}
			if(oUB.getAdditional_costs() != 0) {
				if(flag == 0)
					value += "where KosztaDodatkowe = " + Integer.toString(oUB.getValue());
				flag++;
			}
		}
		if( oUB.getTransaction_id_from() != 0 || oUB.getRental_id_from() != 0 || oUB.getValue_from() != 0 || oUB.getRental_time_from() != null || oUB.getStand_time_from() != null || oUB.getAdditional_costs_from() !=0) {
			if(oUB.getTransaction_id_from() != 0) {
				if(flag == 0)
					value += "where Transakcja_ID between " + Integer.toString(oUB.getTransaction_id_from()) + " and " + Integer.toString(oUB.getTransaction_id_to());
				else
					value += " and Transakcja_ID between " + Integer.toString(oUB.getTransaction_id_from()) + " and " + Integer.toString(oUB.getTransaction_id_to());
				flag++;
			}
			if(oUB.getRental_id_from() != 0) {
				if(flag == 0)
					value += "where wypozyczenie_ID between " + Integer.toString(oUB.getRental_id_from()) + " and " + Integer.toString(oUB.getRental_id_from());
				else
					value += " and wypozyczenie_ID between " + Integer.toString(oUB.getRental_id_from()) + " and " + Integer.toString(oUB.getRental_id_from());
				flag++;
			}
			if(oUB.getValue_from() != 0) {
				if(flag == 0)
					value += "where kwota between \"" + Integer.toString(oUB.getValue_from()) + "\" and \"" +  Integer.toString(oUB.getValue_to()) + "\" ";
				else
					value += " and kwota between \"" + Integer.toString(oUB.getValue_from()) + "\" and \"" +  Integer.toString(oUB.getValue_to()) + "\" ";
				flag++;
			}
			if(oUB.getRental_time_from() != null) {
				if(flag == 0)
					value += "where CzasWypozyczenia between  \"" + oUB.getValue_from() + "\" and \"" +  oUB.getValue_to() + "\" ";
				else
					value += " and CzasWypozyczenia between  \"" + oUB.getValue_from() + "\" and \"" +  oUB.getValue_to() + "\" ";
				flag++;
			}
			if(oUB.getStand_time_from() != null) {
				if(flag == 0)
					value += "where CzasPostoju between  \"" + oUB.getRental_time_from() + "\" and \"" +  oUB.getRental_time_to() + "\" ";
				else
					value += " and CzasPostoju between  \"" + oUB.getRental_time_from() + "\" and \"" +  oUB.getRental_time_to() + "\" ";
				flag++;
			}
			if(oUB.getAdditional_costs_from() != 0) {
				if(flag == 0)
					value += "where KosztaDodatkowe between  \"" + Integer.toString(oUB.getAdditional_costs_from()) + "\" and \"" +  Integer.toString(oUB.getAdditional_costs_to()) + "\" ";
				else
					value += " and KosztaDodatkowe between  \"" + Integer.toString(oUB.getAdditional_costs_from()) + "\" and \"" +  Integer.toString(oUB.getAdditional_costs_to()) + "\" ";
				flag++;
			}
		}
		
		
		
		return value;
	}
}