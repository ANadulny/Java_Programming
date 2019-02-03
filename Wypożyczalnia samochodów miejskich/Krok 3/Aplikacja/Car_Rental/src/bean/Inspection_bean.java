package bean;
import java.sql.*;

public class Inspection_bean {
	private int index;
	private int id;
	private String register_number;
	private int workshop_id;
	private String workshop_name;
	private int cost;
	private Date inspection_date;
	private String inspection_date_tmp;
	
	private int inspection_id_from;
	private String register_number_from;
	private int workshop_id_from;
	private String workshop_name_from;
	private int price_from;
	private Date date_from;
	private String date_from_tmp;
	
	private int inspection_id_to;
	private String register_number_to;
	private int workshop_id_to;
	private String workshop_name_to;
	private int price_to;
	private Date date_to;
	private String date_to_tmp;
	
	public Inspection_bean(int index, int id, String register_number, int workshop_id, String workshop_name, int cost, Date inspection_date) {
		this.index = index;
		this.id = id;
		this.register_number = register_number;
		this.workshop_id = workshop_id;
		this.workshop_name = workshop_name;
		this.cost = cost;
		this.inspection_date = inspection_date;
	}

	public Inspection_bean() {
		
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRegister_number() {
		return register_number;
	}

	public void setRegister_number(String register_number) {
		this.register_number = register_number;
	}

	public int getWorkshop_id() {
		return workshop_id;
	}

	public void setWorkshop_id(int workshop_id) {
		this.workshop_id = workshop_id;
	}

	public String getWorkshop_name() {
		return workshop_name;
	}

	public void setWorkshop_name(String workshop_name) {
		this.workshop_name = workshop_name;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public Date getInspection_date() {
		return inspection_date;
	}

	public void setInspection_date(Date inspection_date) {
		this.inspection_date = inspection_date;
	}

	public int getInspection_id_from() {
		return inspection_id_from;
	}

	public void setInspection_id_from(int inspection_id_from) {
		this.inspection_id_from = inspection_id_from;
	}

	public String getRegister_number_from() {
		return register_number_from;
	}

	public void setRegister_number_from(String register_number_from) {
		this.register_number_from = register_number_from;
	}

	public int getWorkshop_id_from() {
		return workshop_id_from;
	}

	public void setWorkshop_id_from(int workshop_id_from) {
		this.workshop_id_from = workshop_id_from;
	}

	public String getWorkshop_name_from() {
		return workshop_name_from;
	}

	public void setWorkshop_name_from(String workshop_name_from) {
		this.workshop_name_from = workshop_name_from;
	}

	public int getPrice_from() {
		return price_from;
	}

	public void setPrice_from(int price_from) {
		this.price_from = price_from;
	}

	public Date getDate_from() {
		return date_from;
	}

	public void setDate_from(Date date_from) {
		this.date_from = date_from;
	}

	public int getInspection_id_to() {
		return inspection_id_to;
	}

	public void setInspection_id_to(int inspection_id_to) {
		this.inspection_id_to = inspection_id_to;
	}

	public String getRegister_number_to() {
		return register_number_to;
	}

	public void setRegister_number_to(String register_number_to) {
		this.register_number_to = register_number_to;
	}

	public int getWorkshop_id_to() {
		return workshop_id_to;
	}

	public void setWorkshop_id_to(int workshop_id_to) {
		this.workshop_id_to = workshop_id_to;
	}

	public String getWorkshop_name_to() {
		return workshop_name_to;
	}

	public void setWorkshop_name_to(String workshop_name_to) {
		this.workshop_name_to = workshop_name_to;
	}

	public int getPrice_to() {
		return price_to;
	}

	public void setPrice_to(int price_to) {
		this.price_to = price_to;
	}

	public Date getDate_to() {
		return date_to;
	}

	public void setDate_to(Date date_to) {
		this.date_to = date_to;
	}

	public String getInspection_date_tmp() {
		return inspection_date_tmp;
	}

	public void setInspection_date_tmp(String inspection_date_tmp) {
		this.inspection_date_tmp = inspection_date_tmp;
	}

	public String getDate_from_tmp() {
		return date_from_tmp;
	}

	public void setDate_from_tmp(String date_from_tmp) {
		this.date_from_tmp = date_from_tmp;
	}

	public String getDate_to_tmp() {
		return date_to_tmp;
	}

	public void setDate_to_tmp(String date_to_tmp) {
		this.date_to_tmp = date_to_tmp;
	}
	
	
}
