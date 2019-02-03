package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.Login_Bean;
import common_things.DB_Connection;

public class Login_Modal {
	
	public int check_user_name(Login_Bean obj_Login_Bean) {
		int flag = 0;
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String qurey = "select * from Administratorzy where Login=? and Haslo=?";
			ps = connection.prepareStatement(qurey);
			ps.setString(1, obj_Login_Bean.getUser_name());
			ps.setString(2, obj_Login_Bean.getPassword());
			System.out.println(ps);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = 1;
			}
			if(flag != 1) {
				qurey = "select * from konto where Login=? and Haslo=?";
				ps = connection.prepareStatement(qurey);
				ps.setString(1, obj_Login_Bean.getUser_name());
				ps.setString(2, obj_Login_Bean.getPassword());
				System.out.println(ps);
				rs = ps.executeQuery();
				if (rs.next()) {
					flag = 2;
				}
			}
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
		return flag;
	}
}