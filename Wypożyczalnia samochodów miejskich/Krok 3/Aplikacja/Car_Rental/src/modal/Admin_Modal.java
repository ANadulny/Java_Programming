package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Admin_Bean;
import common_things.DB_Connection;

public class Admin_Modal {
	
	public List<Admin_Bean> give_admin_profiles() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Admin_Bean> list = new ArrayList();
		
		try {
			String qurey = "select * from Administratorzy";
			ps = connection.prepareStatement(qurey);
			System.out.println(ps);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new Admin_Bean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
}