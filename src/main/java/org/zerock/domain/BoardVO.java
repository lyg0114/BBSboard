package org.zerock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;

public class BoardVO {
	private Integer bno;
	private String title;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private String content;
	private int replycnt;
	
	private String[] files;
	
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	
	
	
	
}
