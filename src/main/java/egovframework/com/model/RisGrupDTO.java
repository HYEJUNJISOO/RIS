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
public class RisGrupDTO {
	// 최초입력일시
	private String sysDate;
	// 작업자
	@Max(10)
	private String userId;
	// 최종변경일시
	private String udpDate;
	// 병원(회원) ID
	@Max(10)
	private String heptId;
	// 시스템ID
	@Max(10)
	private String systemId;
	// 프로그램 ID
	@Max(10)
	private String menuGroupId;
	// 프로그램 명칭
	@Max(100)
	private String menuGroupName;
	// 사용여부
	@Max(1)
	private String useYn;
	// 정렬순서
	@Max(11)
	private String otptSqnc;
}