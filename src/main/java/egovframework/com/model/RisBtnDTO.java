package egovframework.com.model;
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
public class RisBtnDTO {
	// 병원ID
	@Max(20)
	private String hsptId;
	// 데이터 구분 M: GRADE, U: 사용자
	@Max(1)
	private String dataGubun;
	// M: SADU, U : 예외 사용자
	@Max(20)
	private String userGrade;
	// 프로그램 ID
	@Max(100)
	private String pgrmId;
	// 버튼 ID
	@Max(100)
	private String pgrmBtn;
	// 사용여부
	@Max(1)
	private String useYn;
	@Max(20)
	private String rgstId;
	private String rgstDttm;
	@Max(20)
	private String mdfcId;
	private String mdfcDttm;
}