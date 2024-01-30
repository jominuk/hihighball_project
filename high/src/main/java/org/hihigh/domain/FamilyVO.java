package org.hihigh.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FamilyVO {
	
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String email;
	private Date reg_date;
	private String age;
	private String filename;
}
