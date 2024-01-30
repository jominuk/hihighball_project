package org.hihigh.domain;

import java.util.Date;
import lombok.Data;

@Data
public class ReplyVO {

	private Long renum;
	private Long bnum;
	private String id;
	private String recontents;
	private Date redate;
}
