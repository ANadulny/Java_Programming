package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.Register_Bean;
import common_things.DB_Connection;

public class Register_Modal {
	
	public int register(Register_Bean obj_Register_Bean) {
		int flag = 0, old_user_count=0, new_user_count=0, old_account_count=0, new_account_count=0;
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection = obj_DB_Connection.getConnection();
		PreparedStatement ps_user = null, ps_account = null, ps_user_ID_query = null, ps_delete = null;
		ResultSet rs_user = null, rs_account = null, rs_user_ID_query = null, tmp = null;
		try {
			String user_query = "insert into Uzytkownik (Imie, Nazwisko, Pesel, NrTelefonu) values (?, ?, ?, ?)";
			String account_query= "insert into Konto (Uzytkownik_ID, Srodki, Login, Haslo, AdresEmail) values (?, ?, ?, ?, ?)";
			String user_ID_query = "SELECT count(*) FROM uzytkownik";
			String count_accounts = "SELECT count(*) FROM Konto";
			String delete_query = "DELETE FROM uzytkownik WHERE ?";
			
			tmp = connection.prepareStatement(user_ID_query).executeQuery();
			tmp.next();
			old_user_count = tmp.getInt(1);
			
			ps_user = connection.prepareStatement(user_query);
			ps_user.setString(1, obj_Register_Bean.getName());
			ps_user.setString(2, obj_Register_Bean.getSurename());
			ps_user.setString(3, obj_Register_Bean.getPesel());
			ps_user.setString(4, obj_Register_Bean.getPhone_number());
			System.out.println(ps_user);
			ps_user.execute();
			
			tmp = connection.prepareStatement(user_ID_query).executeQuery();
			tmp.next();
			new_user_count = tmp.getInt(1);	
			
			if (new_user_count > old_user_count) {
				flag = 1;
				
				tmp = connection.prepareStatement(count_accounts).executeQuery();
				tmp.next();
				old_account_count = tmp.getInt(1);
				ps_account = connection.prepareStatement(account_query);
				ps_account.setString(1, String.valueOf(new_user_count));
				ps_account.setString(2, "0");
				ps_account.setString(3, obj_Register_Bean.getUser_name());
				ps_account.setString(4, obj_Register_Bean.getPassword());
				ps_account.setString(5, obj_Register_Bean.getEmail());
				System.out.println(ps_account);
				ps_account.execute();
				
				tmp = connection.prepareStatement(count_accounts).executeQuery();
				tmp.next();
				new_account_count = tmp.getInt(1);
				
				if(new_account_count > old_account_count) {
					flag = 2;
				}else {
					ps_delete = connection.prepareStatement(delete_query);
					ps_delete.setString(1, rs_user_ID_query.toString());
					ps_delete.execute();
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