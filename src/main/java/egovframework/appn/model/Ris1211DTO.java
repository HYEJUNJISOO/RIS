package egovframework.appn.model;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.validation.constraints.Max;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotBlank;


import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Ris1211DTO {
	@NotBlank
	private Integer pkris1211;
	@NotBlank
	@Max(20)
	private String hsptId;
	@Max(20)
	private String vistDvsn;
	@Max(20)
	private String ptntId;
	@Max(100)
	private String ptntKrNm;
	private String brth;
	@Max(20)	
	private String gndrDvsn;
	@Max(50)
	private String mobl;
	@Max(1)
	private String tmprAppnYn;
	private Integer fkris1201;
	@Max(20)
	private String ordrFk;
	@Max(20)
	private String imgnRoomCd;
	@Max(1)
	private String pmntYn;
	private String dsrdDate;
	private String dsrdTime;
	private String appnDate;
	private String appnTime;
	@Max(20)
	private String appnPrgrDvsn;
	@Max(1000)
	private String appnNoteText;
	@Max(20)
	private String rgstId;
	private String rgstDttm;
	@Max(20)
	private String mdfcId;
	private String mdfcDttm;
}
