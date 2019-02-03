package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Model_bean;
import bean.Price_bean;
import common_things.DB_Connection;

public class Price_modal {
	
	public List<Price_bean> give_price_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Price_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from cennik";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Price_bean(i, rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
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
	
	public List<Price_bean> give_price_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Price_bean> list = new ArrayList();
		
		try {
			String qurey = "select * from cennik " + value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Price_bean(i, rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
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
	
	public String price_filtr_conditions(Price_bean oPB) {
		String value = "";
		int flag = 0;
		if( oPB.getPrice_id() != 0 || oPB.getPrice_km() != 0 || oPB.getPrice_minute() != 0 
					|| oPB.getPrice_hour() != 0 || oPB.getPrice_day() != 0 || oPB.getPrice_stand() != 0) {
			if(oPB.getPrice_id() != 0) {
				if(flag == 0)
					value += " where Cena_ID =" + Integer.toString(oPB.getPrice_id());
				else
					value += " and Cena_ID =" + Integer.toString(oPB.getPrice_id());
				flag++;
			}
			if(oPB.getPrice_km() != 0) {
				if(flag == 0)
					value += " where PLN_za_km =" + Integer.toString(oPB.getPrice_km());
				else
					value += "and PLN_za_km =" + Integer.toString(oPB.getPrice_km());
				flag++;
			}
			if(oPB.getPrice_minute() != 0) {
				if(flag == 0)
					value += " where PLN_za_minute =" + Integer.toString(oPB.getPrice_minute());
				else
					value += " and PLN_za_minute =" + Integer.toString(oPB.getPrice_minute());
				flag++;
			}
			if(oPB.getPrice_hour() != 0) {
				if(flag == 0)
					value += " where PLN_za_godzine =" + Integer.toString(oPB.getPrice_hour());
				else
					value += " and PLN_za_godzine =" + Integer.toString(oPB.getPrice_hour());
				flag++;
			}
			if(oPB.getPrice_day() != 0) {
				if(flag == 0)
					value += " where PLN_za_dobe =" + Integer.toString(oPB.getPrice_day());
				else
					value += " and PLN_za_dobe =" + Integer.toString(oPB.getPrice_day());
				flag++;
			}
			if(oPB.getPrice_stand() != 0) {
				
				if(flag == 0)
					value += " where PLN_za_postoj =" + Integer.toString(oPB.getPrice_stand());
				else
					value += " and PLN_za_postoj =" + Integer.toString(oPB.getPrice_stand());
				flag++;
			}
		}
		if( (oPB.getPrice_id_from() != 0 && oPB.getPrice_id_to() != 0) || (oPB.getPrice_per_km_from() != 0 && oPB.getPrice_per_km_to() != 0) || (oPB.getPrice_per_hour_from() != 0 && oPB.getPrice_per_hour_to() != 0) || 
				(oPB.getPrice_per_minute_from() != 0 && oPB.getPrice_per_minute_to() != 0) || (oPB.getPrice_per_day_from() != 0 && oPB.getPrice_per_day_to() != 0) || (oPB.getPrice_per_stand_from() != 0 && oPB.getPrice_per_stand_to() != 0) ) {
			if(oPB.getPrice_id_from() != 0) {
				if(flag == 0)
					value += " where Cena_ID between " + Integer.toString(oPB.getPrice_id_from()) + " and " + Integer.toString(oPB.getPrice_id_to());
				else
					value += " and Cena_ID between " + Integer.toString(oPB.getPrice_id_from()) + " and " + Integer.toString(oPB.getPrice_id_to());
				flag++;
			}
			if(oPB.getPrice_per_km_from() != 0) {
				if(flag == 0)
					value += " where PLN_za_km between " + Integer.toString(oPB.getPrice_per_km_from()) + " and " + Integer.toString(oPB.getPrice_per_km_to());
				else
					value += " and PLN_za_km between " + Integer.toString(oPB.getPrice_per_km_from()) + " and " + Integer.toString(oPB.getPrice_per_km_to());
				flag++;
			}
			if(oPB.getPrice_per_hour_from() != 0) {
				if(flag == 0)
					value += " where PLN_za_godzine between " + Integer.toString(oPB.getPrice_per_hour_from()) + " and " + Integer.toString(oPB.getPrice_per_hour_to());
				else
					value += " and PLN_za_godzine between " + Integer.toString(oPB.getPrice_per_hour_from()) + " and " + Integer.toString(oPB.getPrice_per_hour_to());
				flag++;
			}
			if(oPB.getPrice_per_minute_from() != 0) {
				if(flag == 0)
					value += " where PLN_za_minute between " + Integer.toString(oPB.getPrice_per_minute_from()) + " and " + Integer.toString(oPB.getPrice_per_minute_to());
				else
					value += " and PLN_za_minute between " + Integer.toString(oPB.getPrice_per_minute_from()) + " and " + Integer.toString(oPB.getPrice_per_minute_to());
				flag++;
			}
			if(oPB.getPrice_per_day_from() != 0) {
				if(flag == 0)
					value += " where PLN_za_dobe between " + Integer.toString(oPB.getPrice_per_day_from()) + " and " + Integer.toString(oPB.getPrice_per_day_to());
				else
					value += " and PLN_za_dobe between " + Integer.toString(oPB.getPrice_per_day_from()) + " and " + Integer.toString(oPB.getPrice_per_day_to());
				flag++;
			}
			if(oPB.getPrice_per_stand_from() != 0) {
				if(flag == 0)
					value += " where PLN_za_postoj between " + Integer.toString(oPB.getPrice_per_stand_from()) + " and " + Integer.toString(oPB.getPrice_per_stand_to());
				else
					value += " and PLN_za_postoj between " + Integer.toString(oPB.getPrice_per_stand_from()) + " and " + Integer.toString(oPB.getPrice_per_stand_to());
				flag++;
			}
		}
		
		return value;
	}
	
}