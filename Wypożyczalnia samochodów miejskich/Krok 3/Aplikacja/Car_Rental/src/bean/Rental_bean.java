package bean;
import java.sql.*;

public class Rental_bean {
	private int index;
	private int rental_id;
	private String register_number;
	private int account_id;
	private Date rental_date;
	private String status;
	
	private int rental_id_from;
	private String register_number_from;
	private int account_id_from;
	private Date rental_date_from;
	private String status_from;
	
	private int rental_id_to;
	private String register_number_to;
	private int account_id_to;
	private Date rental_date_to;
	private String status_to;
	
	public Rental_bean(int index, int rental_id, int account_id, String register_number, Date rental_date, String status) {
		this.index = index;
		this.rental_id = rental_id;
		this.register_number = register_number;
		this.account_id = account_id;
		this.rental_date = rental_date;
		this.status = status;
	}
	
	public Rental_bean() {
		
	}

	public String getRegister_number() {
		return register_number;
	}

	public void setRegister_number(String register_number) {
		this.register_number = register_number;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getRental_id() {
		return rental_id;
	}

	public void setRental_id(int rental_id) {
		this.rental_id = rental_id;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public Date getRental_date() {
		return rental_date;
	}

	public void setRental_date(Date rental_date) {
		this.rental_date = rental_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRental_id_from() {
		return rental_id_from;
	}

	public void setRental_id_from(int rental_id_from) {
		this.rental_id_from = rental_id_from;
	}

	public String getRegister_number_from() {
		return register_number_from;
	}

	public void setRegister_number_from(String register_number_from) {
		this.register_number_from = register_number_from;
	}

	public int getAccount_id_from() {
		return account_id_from;
	}

	public void setAccount_id_from(int account_id_from) {
		this.account_id_from = account_id_from;
	}

	public Date getRental_date_from() {
		return rental_date_from;
	}

	public void setRental_date_from(Date rental_date_from) {
		this.rental_date_from = rental_date_from;
	}

	public String getStatus_from() {
		return status_from;
	}

	public void setStatus_from(String status_from) {
		this.status_from = status_from;
	}

	public int getRental_id_to() {
		return rental_id_to;
	}

	public void setRental_id_to(int rental_id_to) {
		this.rental_id_to = rental_id_to;
	}

	public String getRegister_number_to() {
		return register_number_to;
	}

	public void setRegister_number_to(String register_number_to) {
		this.register_number_to = register_number_to;
	}

	public int getAccount_id_to() {
		return account_id_to;
	}

	public void setAccount_id_to(int account_id_to) {
		this.account_id_to = account_id_to;
	}

	public Date getRental_date_to() {
		return rental_date_to;
	}

	public void setRental_date_to(Date rental_date_to) {
		this.rental_date_to = rental_date_to;
	}

	public String getStatus_to() {
		return status_to;
	}

	public void setStatus_to(String status_to) {
		this.status_to = status_to;
	}


	
}
