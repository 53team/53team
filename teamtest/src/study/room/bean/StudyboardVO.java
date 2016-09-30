package study.room.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class StudyboardVO implements Serializable {
   
   private int num, limit;
   private String id,title,sub_title,location,category;
   private Timestamp reg_date;
   
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public int getLimit() {
	return limit;
}
public void setLimit(int limit) {
	this.limit = limit;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getSub_title() {
	return sub_title;
}
public void setSub_title(String sub_title) {
	this.sub_title = sub_title;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public Timestamp getReg_date() {
	return reg_date;
}
public void setReg_date(Timestamp reg_date) {
	this.reg_date = reg_date;
}
   
  
}