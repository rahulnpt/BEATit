package com.beatit.dto;

import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="concern")
public class Concern {

	@Id
	@Column(name="concern_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty
	@Column(name = "concern_name")
	private String name;
	
	@Column(name = "concern_desc")
	private String desc;
	
	@Column(name = "image_path")
	private String path;
	
	@Column(name = "entered_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date enteredOn = new Date();

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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getEnteredOn() {
		return enteredOn;
	}

	public void setEnteredOn(Date enteredOn) {
		this.enteredOn = enteredOn;
	}
	
	
}
