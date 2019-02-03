package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Inspection_bean;
import bean.Model_bean;
import common_things.DB_Connection;

public class Inspection_modal {
	
	public List<Inspection_bean> give_inspection_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Inspection_bean> list = new ArrayList();
		
		try {
			String qurey = "select przeglad_id, NrRejestracyjny, warsztat.Warsztat_ID, nazwa, Koszt, DataPrzegladu from przeglad, warsztat where warsztat.warsztat_id = przeglad.warsztat_id order by przeglad_id";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Inspection_bean(i, rs.getInt(1),  rs.getString(2),  rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getDate(6)));
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
	
	public List<Inspection_bean> give_inspection_profiles(String value) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Inspection_bean> list = new ArrayList();
		
		try {
			String qurey = "select przeglad_id, NrRejestracyjny, warsztat.Warsztat_ID, nazwa, Koszt, DataPrzegladu from przeglad, warsztat where warsztat.warsztat_id = przeglad.warsztat_id " + value + " order by przeglad_id " ;
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				list.add(new Inspection_bean(i, rs.getInt(1),  rs.getString(2),  rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getDate(6)));
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
	
	
	public String inspection_filtr_conditions(Inspection_bean oIB) {
		String value = "";
		if( oIB.getId() != 0 || oIB.getRegister_number() != null || oIB.getWorkshop_id() != 0 || oIB.getWorkshop_name() != null || oIB.getCost() != 0 || oIB.getInspection_date_tmp() != null) {
			if(oIB.getId() != 0) {
				value += "and Przeglad_ID = " + Integer.toString(oIB.getId());
			}
			if(oIB.getRegister_number() != null) {
				value += "where NrRejestracyjny like \"" + oIB.getRegister_number() + "\"";
			}
			if(oIB.getWorkshop_id() != 0) {
				value += "and PLN_za_godzine =" + Integer.toString(oIB.getWorkshop_id());
			}
			if(oIB.getWorkshop_name() != null) {
				value += "where Warsztat_ID like \"" + oIB.getWorkshop_name() + "\"";
			}
			if(oIB.getCost() != 0) {
				value += "and Koszt =" + Integer.toString(oIB.getCost());
			}
			if(oIB.getInspection_date_tmp() != null) {
				oIB.setInspection_date(java.sql.Date.valueOf(oIB.getInspection_date_tmp()));
				value += "and DataPrzegladu like \"" + oIB.getInspection_date() + "\"";
			}
		}
		if( (oIB.getInspection_id_from() != 0 && oIB.getInspection_id_to() != 0) || (oIB.getRegister_number_from() != null && oIB.getRegister_number_to() != null) || (oIB.getWorkshop_id_from() != 0 && oIB.getWorkshop_id_to() != 0) || 
				(oIB.getWorkshop_name_from() != null && oIB.getWorkshop_name_to() != null) || (oIB.getPrice_from() != 0 && oIB.getPrice_to() != 0) || (oIB.getDate_from_tmp() != null && oIB.getDate_to_tmp() != null) ) {
			if(oIB.getInspection_id_from() != 0) {
				value += " and Przeglad_ID between " + Integer.toString(oIB.getInspection_id_from()) + " and " + Integer.toString(oIB.getInspection_id_to());
			}
			if(oIB.getRegister_number_from() != null) {
				value += " and NrRejestracyjny between  \"" + oIB.getRegister_number_from() + "\" and \"" +  oIB.getRegister_number_to() + "\" ";
			}
			if(oIB.getWorkshop_id_from() != 0) {
				value += " and Warsztat_ID between " + Integer.toString(oIB.getWorkshop_id_from()) + " and " + Integer.toString(oIB.getWorkshop_id_to());
			}
			if(oIB.getWorkshop_name_from() != null) {
				value += " and Nazwa between  \"" + oIB.getWorkshop_name_from() + "\" and \"" +  oIB.getWorkshop_name_to() + "\" ";
			}
			if(oIB.getPrice_from() != 0) {
				value += " and Koszt between " + Integer.toString(oIB.getPrice_from()) + " and " + Integer.toString(oIB.getPrice_to());
			}
			if(oIB.getDate_from_tmp() != null) {
				oIB.setDate_from(java.sql.Date.valueOf(oIB.getDate_from_tmp()));
				oIB.setDate_to(java.sql.Date.valueOf(oIB.getDate_to_tmp()));
				value += " and DataPrzegladu between  \"" + oIB.getDate_from() + "\" and \"" +  oIB.getDate_to() + "\" ";
			}
		}
		
		return value;
	}
	
}