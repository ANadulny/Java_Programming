package bean;

public class User_bean {
	private int index;
	private int id;
	private String name;
	private String surename;
	private String PESEL;
	private String phone;
	
	
	private int index_from;
	private int id_from;
	private String name_from;
	private String surename_from;
	private String PESEL_from;
	private String phone_from;
	
	private int index_to;
	private int id_to;
	private String name_to;
	private String surename_to;
	private String PESEL_to;
	private String phone_to;
	
	public User_bean(int index, int id, String name, String surename, String PESEL, String phone) {
		this.index = index;
		this.id = id;
		this.name = name;
		this.surename = surename;
		this.PESEL = PESEL;
		this.phone = phone;
	}
	
	public User_bean() {
		
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurename() {
		return surename;
	}

	public void setSurename(String surename) {
		this.surename = surename;
	}

	public String getPESEL() {
		return PESEL;
	}

	public void setPESEL(String pESEL) {
		PESEL = pESEL;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getIndex_from() {
		return index_from;
	}

	public void setIndex_from(int index_from) {
		this.index_from = index_from;
	}

	public int getId_from() {
		return id_from;
	}

	public void setId_from(int id_from) {
		this.id_from = id_from;
	}

	public String getName_from() {
		return name_from;
	}

	public void setName_from(String name_from) {
		this.name_from = name_from;
	}

	public String getSurename_from() {
		return surename_from;
	}

	public void setSurename_from(String surename_from) {
		this.surename_from = surename_from;
	}

	public String getPESEL_from() {
		return PESEL_from;
	}

	public void setPESEL_from(String pESEL_from) {
		this.PESEL_from = pESEL_from;
	}

	public String getPhone_from() {
		return phone_from;
	}

	public void setPhone_from(String phone_from) {
		this.phone_from = phone_from;
	}

	public int getIndex_to() {
		return index_to;
	}

	public void setIndex_to(int index_to) {
		this.index_to = index_to;
	}

	public int getId_to() {
		return id_to;
	}

	public void setId_to(int id_to) {
		this.id_to = id_to;
	}

	public String getName_to() {
		return name_to;
	}

	public void setName_to(String name_to) {
		this.name_to = name_to;
	}

	public String getSurename_to() {
		return surename_to;
	}

	public void setSurename_to(String surename_to) {
		this.surename_to = surename_to;
	}

	public String getPESEL_to() {
		return PESEL_to;
	}

	public void setPESEL_to(String pESEL_to) {
		this.PESEL_to = pESEL_to;
	}

	public String getPhone_to() {
		return phone_to;
	}

	public void setPhone_to(String phone_to) {
		this.phone_to = phone_to;
	}
	
	
	
}
