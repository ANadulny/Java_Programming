package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Model_bean;
import bean.User_bean;
import common_things.DB_Connection;

public class Model_modal {
	
	public List<Model_bean> give_model_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Model_bean> list = new ArrayList();
		
		try {
			String qurey = "select Model_ID, PLN_za_dobe, PLN_za_godzine, MarkaSamochodu, Model, KlasaSamochodu, Spalanie, Automat, Naped from modelsamochodu, cennik where modelsamochodu.cena_id = cennik.cena_id";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Model_bean(i, rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8), rs.getString(9)));
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
	
	public List<Model_bean> give_model_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Model_bean> list = new ArrayList();
		
		try {
			String qurey = "select Model_ID, PLN_za_dobe, PLN_za_godzine, MarkaSamochodu, Model, KlasaSamochodu, Spalanie, Automat, Naped from modelsamochodu, cennik where modelsamochodu.cena_id = cennik.cena_id" + " " + value;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Model_bean(i, rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8), rs.getString(9)));
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
	
	public String model_filtr_conditions(Model_bean oMB) {
		String value = "";
		if( oMB.getId() != 0 || oMB.getPrice_day() != 0 || oMB.getPrice_hour() != 0 || oMB.getProducer() != null || oMB.getModel() != null || oMB.getCar_class() != null || oMB.getConsumption() != 0 || oMB.getGearbox() != null || oMB.getTransmission() != null) {
			if(oMB.getId() != 0) {
				value += "and Model_ID = " + Integer.toString(oMB.getId());
			}
			if(oMB.getPrice_day() != 0) {
				value += "and PLN_za_dobe =" + Integer.toString(oMB.getPrice_day());
			}
			if(oMB.getPrice_hour() != 0) {
				value += "and PLN_za_godzine =" + Integer.toString(oMB.getPrice_hour());
			}
			if(oMB.getProducer() != null) {
				value += "where MarkaSamochodu like \"" + oMB.getProducer() + "\"";
			}
			if(oMB.getModel() != null) {
				value += "and Model like \"" + oMB.getModel() + "\"";
			}
			if(oMB.getCar_class() != null) {
				value += "and KlasaSamochodu like \"" + oMB.getCar_class() + "\"";
			}
			if(oMB.getConsumption() != 0) {
				value += "and Spalanie =" + Double.toString(oMB.getConsumption());
			}
			if(oMB.getGearbox() != null) {
				value += "and Automat like \"" + oMB.getGearbox() + "\"";
			}
			if(oMB.getTransmission() != null) {
				value += "and Naped like \"" + oMB.getTransmission() + "\"";
			}
		}
		if( (oMB.getModel_id_from() != 0 && oMB.getModel_id_to() != 0) || (oMB.getPrice_per_day_from() != 0 && oMB.getPrice_per_day_to() != 0) || (oMB.getPrice_per_hour_from() != 0 && oMB.getPrice_per_hour_to() != 0) || 
				(oMB.getProducer_from() != null && oMB.getProducer_to() != null) || (oMB.getModel_from() != null && oMB.getModel_to() != null) || (oMB.getFuel_consumption_from() != 0 && oMB.getFuel_consumption_to() != 0) ) {
			if(oMB.getModel_id_from() != 0) {
				value += " and Model_ID between " + Integer.toString(oMB.getModel_id_from()) + " and " + Integer.toString(oMB.getModel_id_to());
			}
			if(oMB.getPrice_per_day_from() != 0) {
				value += " and PLN_za_dobe between " + Integer.toString(oMB.getPrice_per_day_from()) + " and " + Integer.toString(oMB.getPrice_per_day_to());
			}
			if(oMB.getPrice_per_hour_from() != 0) {
				value += " and PLN_za_godzine between " + Integer.toString(oMB.getPrice_per_hour_from()) + " and " + Integer.toString(oMB.getPrice_per_hour_to());
			}
			if(oMB.getProducer_from() != null) {
				value += " and MarkaSamochodu between  \"" + oMB.getProducer_from() + "\" and \"" +  oMB.getProducer_to() + "\" ";
			}
			if(oMB.getModel_from() != null) {
				value += " and Model between  \"" + oMB.getModel_from() + "\" and \"" +  oMB.getModel_to() + "\" ";
			}
			if(oMB.getFuel_consumption_from() != 0) {
				value += " and Spalanie between " + Double.toString(oMB.getFuel_consumption_from()) + " and " + Double.toString(oMB.getFuel_consumption_to());
			}
		}
		
		return value;
	}
}