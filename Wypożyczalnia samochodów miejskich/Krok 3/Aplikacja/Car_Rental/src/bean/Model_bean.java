package bean;

public class Model_bean {
	private int index;
	private int id;
	private int price_day;
	private int price_hour;
	private String producer;
	private String model;
	private String car_class;
	private double consumption;
	private String gearbox;
	private String transmission;
	
	private int model_id_from;
	private int price_per_day_from;
	private int price_per_hour_from;
	private String producer_from;
	private String model_from;
	private double fuel_consumption_from;
	
	private int model_id_to;
	private int price_per_day_to;
	private int price_per_hour_to;
	private String producer_to;
	private String model_to;
	private double fuel_consumption_to;
	
	public Model_bean(int index, int id, int price_day, int price_hour, String producer, String model, String car_class, double consumption, String gearbox, String transmission) {
		this.index = index;
		this.id = id;
		this.price_day = price_day;
		this.price_hour = price_hour;
		this.producer = producer;
		this.model = model;
		this.car_class = car_class;
		this.consumption = consumption;
		this.gearbox = gearbox;
		this.transmission = transmission;
	}
	
	public Model_bean() {
		
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

	public int getPrice_day() {
		return price_day;
	}

	public void setPrice_day(int price_day) {
		this.price_day = price_day;
	}

	public int getPrice_hour() {
		return price_hour;
	}

	public void setPrice_hour(int price_hour) {
		this.price_hour = price_hour;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCar_class() {
		return car_class;
	}

	public void setCar_class(String car_class) {
		this.car_class = car_class;
	}

	public double getConsumption() {
		return consumption;
	}

	public void setConsumption(double consumption) {
		this.consumption = consumption;
	}

	public String getGearbox() {
		return gearbox;
	}

	public void setGearbox(String gearbox) {
		this.gearbox = gearbox;
	}

	public String getTransmission() {
		return transmission;
	}

	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}

	public int getModel_id_from() {
		return model_id_from;
	}

	public void setModel_id_from(int model_id_from) {
		this.model_id_from = model_id_from;
	}

	public int getPrice_per_day_from() {
		return price_per_day_from;
	}

	public void setPrice_per_day_from(int price_per_day_from) {
		this.price_per_day_from = price_per_day_from;
	}

	public int getPrice_per_hour_from() {
		return price_per_hour_from;
	}

	public void setPrice_per_hour_from(int price_per_hour_from) {
		this.price_per_hour_from = price_per_hour_from;
	}

	public String getProducer_from() {
		return producer_from;
	}

	public void setProducer_from(String producer_from) {
		this.producer_from = producer_from;
	}

	public String getModel_from() {
		return model_from;
	}

	public void setModel_from(String model_from) {
		this.model_from = model_from;
	}

	public double getFuel_consumption_from() {
		return fuel_consumption_from;
	}

	public void setFuel_consumption_from(double fuel_consumption_from) {
		this.fuel_consumption_from = fuel_consumption_from;
	}

	public int getModel_id_to() {
		return model_id_to;
	}

	public void setModel_id_to(int model_id_to) {
		this.model_id_to = model_id_to;
	}

	public int getPrice_per_day_to() {
		return price_per_day_to;
	}

	public void setPrice_per_day_to(int price_per_day_to) {
		this.price_per_day_to = price_per_day_to;
	}

	public int getPrice_per_hour_to() {
		return price_per_hour_to;
	}

	public void setPrice_per_hour_to(int price_per_hour_to) {
		this.price_per_hour_to = price_per_hour_to;
	}

	public String getProducer_to() {
		return producer_to;
	}

	public void setProducer_to(String producer_to) {
		this.producer_to = producer_to;
	}

	public String getModel_to() {
		return model_to;
	}

	public void setModel_to(String model_to) {
		this.model_to = model_to;
	}

	public double getFuel_consumption_to() {
		return fuel_consumption_to;
	}

	public void setFuel_consumption_to(double fuel_consumption_to) {
		this.fuel_consumption_to = fuel_consumption_to;
	}


	
}
