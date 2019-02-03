package bean;
import java.sql.*;

public class Transaction_bean {
	private int index;
	private int transaction_id;
	private int rental_id;
	private int value;
	private Time rental_time;
	private Time stand_time;
	private int additional_costs;
	
	private int index_from;
	private int transaction_id_from;
	private int rental_id_from;
	private int value_from;
	private Time rental_time_from;
	private Time stand_time_from;
	private int additional_costs_from;
	
	private int index_to;
	private int transaction_id_to;
	private int rental_id_to;
	private int value_to;
	private Time rental_time_to;
	private Time stand_time_to;
	private int additional_costs_to;
	
	public Transaction_bean(int index, int transaction_id, int rental_id, int value, Time rental_time, Time stand_time, int additional_costs) {
		this.index = index;
		this.transaction_id = transaction_id;
		this.rental_id = rental_id;
		this.value = value;
		this.rental_time = rental_time;
		this.stand_time = stand_time;
		this.additional_costs = additional_costs;
	}
	
	public Transaction_bean() {

	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}

	public int getRental_id() {
		return rental_id;
	}

	public void setRental_id(int rental_id) {
		this.rental_id = rental_id;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public Time getRental_time() {
		return rental_time;
	}

	public void setRental_time(Time rental_time) {
		this.rental_time = rental_time;
	}

	public Time getStand_time() {
		return stand_time;
	}

	public void setStand_time(Time stand_time) {
		this.stand_time = stand_time;
	}

	public int getAdditional_costs() {
		return additional_costs;
	}

	public void setAdditional_costs(int additional_costs) {
		this.additional_costs = additional_costs;
	}

	public int getIndex_from() {
		return index_from;
	}

	public void setIndex_from(int index_from) {
		this.index_from = index_from;
	}

	public int getTransaction_id_from() {
		return transaction_id_from;
	}

	public void setTransaction_id_from(int transaction_id_from) {
		this.transaction_id_from = transaction_id_from;
	}

	public int getRental_id_from() {
		return rental_id_from;
	}

	public void setRental_id_from(int rental_id_from) {
		this.rental_id_from = rental_id_from;
	}

	public int getValue_from() {
		return value_from;
	}

	public void setValue_from(int value_from) {
		this.value_from = value_from;
	}

	public Time getRental_time_from() {
		return rental_time_from;
	}

	public void setRental_time_from(Time rental_time_from) {
		this.rental_time_from = rental_time_from;
	}

	public Time getStand_time_from() {
		return stand_time_from;
	}

	public void setStand_time_from(Time stand_time_from) {
		this.stand_time_from = stand_time_from;
	}

	public int getAdditional_costs_from() {
		return additional_costs_from;
	}

	public void setAdditional_costs_from(int additional_costs_from) {
		this.additional_costs_from = additional_costs_from;
	}

	public int getIndex_to() {
		return index_to;
	}

	public void setIndex_to(int index_to) {
		this.index_to = index_to;
	}

	public int getTransaction_id_to() {
		return transaction_id_to;
	}

	public void setTransaction_id_to(int transaction_id_to) {
		this.transaction_id_to = transaction_id_to;
	}

	public int getRental_id_to() {
		return rental_id_to;
	}

	public void setRental_id_to(int rental_id_to) {
		this.rental_id_to = rental_id_to;
	}

	public int getValue_to() {
		return value_to;
	}

	public void setValue_to(int value_to) {
		this.value_to = value_to;
	}

	public Time getRental_time_to() {
		return rental_time_to;
	}

	public void setRental_time_to(Time rental_time_to) {
		this.rental_time_to = rental_time_to;
	}

	public Time getStand_time_to() {
		return stand_time_to;
	}

	public void setStand_time_to(Time stand_time_to) {
		this.stand_time_to = stand_time_to;
	}

	public int getAdditional_costs_to() {
		return additional_costs_to;
	}

	public void setAdditional_costs_to(int additional_costs_to) {
		this.additional_costs_to = additional_costs_to;
	}

}
