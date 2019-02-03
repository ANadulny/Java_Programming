package bean;

public class Workshop_bean {
	private int index;
	private int workshop_id;
	private String name;
	private String ZIP_code;
	private String adress;
	
	private int index_from;
	private int workshop_id_from;
	private String name_from;
	private String ZIP_code_from;
	private String adress_from;
	
	private int index_to;
	private int workshop_id_to;
	private String name_to;
	private String ZIP_code_to;
	private String adress_to;
	
	public Workshop_bean(int index, int workshop_id, String name, String ZIP_code, String adress) {
		this.index = index;
		this.workshop_id = workshop_id;
		this.name = name;
		this.ZIP_code = ZIP_code;
		this.adress = adress;
	}

	public Workshop_bean() {
		
	}
	
	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getWorkshop_id() {
		return workshop_id;
	}

	public void setWorkshop_id(int workshop_id) {
		this.workshop_id = workshop_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZIP_code() {
		return ZIP_code;
	}

	public void setZIP_code(String zIP_code) {
		ZIP_code = zIP_code;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public int getIndex_from() {
		return index_from;
	}

	public void setIndex_from(int index_from) {
		this.index_from = index_from;
	}

	public int getWorkshop_id_from() {
		return workshop_id_from;
	}

	public void setWorkshop_id_from(int workshop_id_from) {
		this.workshop_id_from = workshop_id_from;
	}

	public String getName_from() {
		return name_from;
	}

	public void setName_from(String name_from) {
		this.name_from = name_from;
	}

	public String getZIP_code_from() {
		return ZIP_code_from;
	}

	public void setZIP_code_from(String zIP_code_from) {
		ZIP_code_from = zIP_code_from;
	}

	public String getAdress_from() {
		return adress_from;
	}

	public void setAdress_from(String adress_from) {
		this.adress_from = adress_from;
	}

	public int getIndex_to() {
		return index_to;
	}

	public void setIndex_to(int index_to) {
		this.index_to = index_to;
	}

	public int getWorkshop_id_to() {
		return workshop_id_to;
	}

	public void setWorkshop_id_to(int workshop_id_to) {
		this.workshop_id_to = workshop_id_to;
	}

	public String getName_to() {
		return name_to;
	}

	public void setName_to(String name_to) {
		this.name_to = name_to;
	}

	public String getZIP_code_to() {
		return ZIP_code_to;
	}

	public void setZIP_code_to(String zIP_code_to) {
		ZIP_code_to = zIP_code_to;
	}

	public String getAdress_to() {
		return adress_to;
	}

	public void setAdress_to(String adress_to) {
		this.adress_to = adress_to;
	}

	
}
