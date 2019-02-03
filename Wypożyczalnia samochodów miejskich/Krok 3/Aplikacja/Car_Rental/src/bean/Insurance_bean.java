package bean;
import java.sql.*;

public class Insurance_bean {
	private int index;
	private int insurance_id;
	private String user_name;
	private String user_surename;
	private int account_id;
	private Date expire_date;
	private String expire_date_tmp;
	
	private int index_from;
	private int insurance_id_from;
	private String user_name_from;
	private String user_surename_from;
	private int account_id_from;
	private Date expire_date_from;
	private String expire_date_from_tmp;
	
	private int index_to;
	private int insurance_id_to;
	private String user_name_to;
	private String user_surename_to;
	private int account_id_to;
	private Date expire_date_to;
	private String expire_date_to_tmp;
	
	public Insurance_bean(int index, int insurance_id, int account_id, String user_name, String user_surename, Date expire_date) {
		this.index = index;
		this.insurance_id = insurance_id;
		this.account_id = account_id;
		this.user_name = user_name;
		this.user_surename = user_surename;
		this.expire_date = expire_date;
	}
	
	public Insurance_bean() {
		
	}

	
	
	public String getExpire_date_tmp() {
		return expire_date_tmp;
	}

	public void setExpire_date_tmp(String expire_date_tmp) {
		this.expire_date_tmp = expire_date_tmp;
	}

	public String getExpire_date_from_tmp() {
		return expire_date_from_tmp;
	}

	public void setExpire_date_from_tmp(String expire_date_from_tmp) {
		this.expire_date_from_tmp = expire_date_from_tmp;
	}

	public String getExpire_date_to_tmp() {
		return expire_date_to_tmp;
	}

	public void setExpire_date_to_tmp(String expire_date_to_tmp) {
		this.expire_date_to_tmp = expire_date_to_tmp;
	}

	public int getIndex_from() {
		return index_from;
	}

	public void setIndex_from(int index_from) {
		this.index_from = index_from;
	}

	public int getInsurance_id_from() {
		return insurance_id_from;
	}

	public void setInsurance_id_from(int insurance_id_from) {
		this.insurance_id_from = insurance_id_from;
	}

	public String getUser_name_from() {
		return user_name_from;
	}

	public void setUser_name_from(String user_name_from) {
		this.user_name_from = user_name_from;
	}

	public String getUser_surename_from() {
		return user_surename_from;
	}

	public void setUser_surename_from(String user_surename_from) {
		this.user_surename_from = user_surename_from;
	}

	public int getAccount_id_from() {
		return account_id_from;
	}

	public void setAccount_id_from(int account_id_from) {
		this.account_id_from = account_id_from;
	}

	public Date getExpire_date_from() {
		return expire_date_from;
	}

	public void setExpire_date_from(Date expire_date_from) {
		this.expire_date_from = expire_date_from;
	}

	public int getIndex_to() {
		return index_to;
	}

	public void setIndex_to(int index_to) {
		this.index_to = index_to;
	}

	public int getInsurance_id_to() {
		return insurance_id_to;
	}

	public void setInsurance_id_to(int insurance_id_to) {
		this.insurance_id_to = insurance_id_to;
	}

	public String getUser_name_to() {
		return user_name_to;
	}

	public void setUser_name_to(String user_name_to) {
		this.user_name_to = user_name_to;
	}

	public String getUser_surename_to() {
		return user_surename_to;
	}

	public void setUser_surename_to(String user_surename_to) {
		this.user_surename_to = user_surename_to;
	}

	public int getAccount_id_to() {
		return account_id_to;
	}

	public void setAccount_id_to(int account_id_to) {
		this.account_id_to = account_id_to;
	}

	public Date getExpire_date_to() {
		return expire_date_to;
	}

	public void setExpire_date_to(Date expire_date_to) {
		this.expire_date_to = expire_date_to;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_surename() {
		return user_surename;
	}

	public void setUser_surename(String user_surename) {
		this.user_surename = user_surename;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getInsurance_id() {
		return insurance_id;
	}

	public void setInsurance_id(int insurance_id) {
		this.insurance_id = insurance_id;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public Date getExpire_date() {
		return expire_date;
	}

	public void setExpire_date(Date expire_date) {
		this.expire_date = expire_date;
	}


	
}
