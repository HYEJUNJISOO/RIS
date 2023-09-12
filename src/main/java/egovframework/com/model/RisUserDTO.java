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
public class RisUserDTO {
	// 최초 입력 일시
	private String sysDate;
	// 작업자
	@Max(10)
	private String userId;
	// 최종변경일시
	private String updDate;
	// 병원아이디
	@Max(10)
	private String hsptId;
	// 시스템 아이디
	@Max(10)
	private String loginId;
	// 시스템 명
	@Max(100)
	private String loginNm;
	// 비밀번호(암호화)
	@Max(200)
	private String loginPwd;
	// 권한등급(S,A,D,U)
	@Max(2)
	private String userGrade;
	// 적용 시작일
	private String startDate;
	// 적용 종료일
	private String endDate;
	// 비밀번호 오류 횟수 
	@Max(11)
	private int errorCnt;
	// 주언어 구분
	@Max(10)
	private String langGubun;
	@Max(11)
	private int pacsFk;
}