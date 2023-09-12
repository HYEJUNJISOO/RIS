package egovframework.appn.model;
import java.time.LocalDateTime;
import java.time.LocalTime;


import javax.validation.constraints.Size;

import org.springmodules.validation.bean.conf.loader.annotation.handler.NotBlank;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Ris0210DTO {
	@NotBlank
	@Size(max = 20)
	private String hsptId;
	@NotBlank
	@Size(max = 20)
	private String imgnRoomCd;
	@NotBlank
	@Size(max = 10)
	private String wkdy;
	@NotBlank
	private String strtTime;
	private String endTime;
	private Integer appnOutpPssbCnt;
	private Integer appnInptPssbCnt;
	private Integer appnHlxmPssbCnt;
	@Size(max = 20)
	private String rgstId;
	private String rgstDttm;
	@Size(max = 20)
	private String mdfcId;
	private String mdfcDttm;
}