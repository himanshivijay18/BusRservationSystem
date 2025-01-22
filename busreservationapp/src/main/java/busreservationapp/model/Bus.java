package busreservationapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import net.bytebuddy.dynamic.loading.ClassReloadingStrategy.Strategy;
@Entity
@Table(name = "Bus")
public class Bus {
	@Id
private int busno;
private int seat_capacity;
private String type;
private String source;
private String destination;
private String stops;
private String date;
private String dept_time;
private String arrival_time;
private int price;
private String dept_day;
private String arrival_day;
public int getBusno() {
	return busno;
}
public void setBusno(int busno) {
	this.busno = busno;
}
public int getSeat_capacity() {
	return seat_capacity;
}
public void setSeat_capacity(int seat_capacity) {
	this.seat_capacity = seat_capacity;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getSource() {
	return source;
}
public void setSource(String source) {
	this.source = source;
}
public String getDestination() {
	return destination;
}
public void setDestination(String destination) {
	this.destination = destination;
}
public String getStops() {
	return stops;
}
public void setStops(String stops) {
	this.stops = stops;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getDept_time() {
	return dept_time;
}
public void setDept_time(String dept_time) {
	this.dept_time = dept_time;
}
public String getArrival_time() {
	return arrival_time;
}
public void setArrival_time(String arrival_time) {
	this.arrival_time = arrival_time;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getDept_day() {
	return dept_day;
}
public void setDept_day(String dept_day) {
	this.dept_day = dept_day;
}
public String getArrival_day() {
	return arrival_day;
}
public void setArrival_day(String arrival_day) {
	this.arrival_day = arrival_day;
}
@Override
public String toString() {
	return "Bus [busno=" + busno + ", seat_capacity=" + seat_capacity + ", type=" + type + ", source=" + source
			+ ", destination=" + destination + ", stops=" + stops + ", date=" + date + ", dept_time=" + dept_time
			+ ", arrival_time=" + arrival_time + ", price=" + price + ", dept_day=" + dept_day + ", arrival_day="
			+ arrival_day + "]";
}
public Bus(int busno, int seat_capacity, String type, String source, String destination, String stops, String date,
		String dept_time, String arrival_time, int price, String dept_day, String arrival_day) {
	super();
	this.busno = busno;
	this.seat_capacity = seat_capacity;
	this.type = type;
	this.source = source;
	this.destination = destination;
	this.stops = stops;
	this.date = date;
	this.dept_time = dept_time;
	this.arrival_time = arrival_time;
	this.price = price;
	this.dept_day = dept_day;
	this.arrival_day = arrival_day;
}
public Bus() {
	super();
	// TODO Auto-generated constructor stub
}


}
