package org.hihigh.domain;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {
	
	private Long bnum;
	private String id;
	private String subject;
	private String contents;
	private String postfile;
	private int count;
	private Date re_date;
	private String profile;
}
