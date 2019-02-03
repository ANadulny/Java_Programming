package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import bean.Register_Bean;
import common_things.DB_Connection;

public class Update_Modal {

 public int register(Register_Bean obj_Register_Bean) {
  int flag = 0;
  DB_Connection obj_DB_Connection = new DB_Connection();
  Connection connection = obj_DB_Connection.getConnection();
  PreparedStatement ps_user = null, ps_account = null;
  try {

   String user_query;
   if (obj_Register_Bean.getId() == null) {
    if (obj_Register_Bean.getPhone_number() != null) {
     user_query = "update Uzytkownik set  NrTelefonu = ? where Pesel = ?";
     ps_user = connection.prepareStatement(user_query);
     ps_user.setString(1, obj_Register_Bean.getPhone_number());
     ps_user.setString(2, obj_Register_Bean.getPesel());
     System.out.println(ps_user);
     ps_user.execute();
    }
    if (obj_Register_Bean.getName() != null) {
     user_query = "update Uzytkownik set  Imie = ? where Pesel = ?";
     ps_user = connection.prepareStatement(user_query);
     ps_user.setString(1, obj_Register_Bean.getName());
     ps_user.setString(2, obj_Register_Bean.getPesel());
     System.out.println(ps_user);
     ps_user.execute();
    }
    if (obj_Register_Bean.getSurename() != null) {
     user_query = "update Uzytkownik set  Nazwisko = ? where Pesel = ?";
     ps_user = connection.prepareStatement(user_query);
     ps_user.setString(1, obj_Register_Bean.getSurename());
     ps_user.setString(2, obj_Register_Bean.getPesel());
     System.out.println(ps_user);
     ps_user.execute();
    }
    if (obj_Register_Bean.getEmail() != null) {
     user_query = "update Konto set  AdresEmail = ? where Login = ?";
     ps_user = connection.prepareStatement(user_query);
     ps_user.setString(1, obj_Register_Bean.getEmail());
     ps_user.setString(2, obj_Register_Bean.getUser_name());
     System.out.println(ps_user);
     ps_user.execute();
    }
    if (obj_Register_Bean.getPassword() != null) {
     user_query = "update Konto set  Haslo = ? where Login = ?";
     ps_user = connection.prepareStatement(user_query);
     ps_user.setString(1, obj_Register_Bean.getPassword());
     ps_user.setString(2, obj_Register_Bean.getUser_name());
     System.out.println(ps_user);
     ps_user.execute();
    }

    flag = 2;
   } else {
    if (obj_Register_Bean.getPassword() != null) {
     user_query = "update administratorzy set  Haslo = ? where Login = ?";
     ps_user = connection.prepareStatement(user_query);
     ps_user.setString(1, obj_Register_Bean.getPassword());
     ps_user.setString(2, obj_Register_Bean.getUser_name());
     System.out.println(ps_user);
     ps_user.execute();
    }
    if (obj_Register_Bean.getName() != null) {
     user_query = "update administratorzy set  Imie = ? where Login = ?";
     ps_user = connection.prepareStatement(user_query);
     ps_user.setString(1, obj_Register_Bean.getName());
     ps_user.setString(2, obj_Register_Bean.getUser_name());
     System.out.println(ps_user);
     ps_user.execute();
    }
    flag = 3;
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