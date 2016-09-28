package study.freeboard.bean;

import java.sql.Timestamp;

public class ReplyVO {
	String re_writer, re_content;
	Timestamp re_reg_date;
	int re_num, reply_num;
	
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Timestamp getRe_reg_date() {
		return re_reg_date;
	}
	public void setRe_reg_date(Timestamp re_reg_date) {
		this.re_reg_date = re_reg_date;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	
	
}
