package bean;

public class Car_bean {
	private int index;
	private String register_number;
	private int model_id;
	private double mileage;
	private String availability;
	
	public Car_bean(int index, String register_number, int model_id, double mileage, String availability) {
		this.index = index;
		this.register_number = register_number;
		this.model_id = model_id;
		this.mileage = mileage;
		this.availability = availability;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getRegister_number() {
		return register_number;
	}

	public void setRegister_number(String register_number) {
		this.register_number = register_number;
	}

	public int getModel_id() {
		return model_id;
	}

	public void setModel_id(int model_id) {
		this.model_id = model_id;
	}

	public double getMileage() {
		return mileage;
	}

	public void setMileage(double mileage) {
		this.mileage = mileage;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}



	
}
