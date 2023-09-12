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
public class RisPgrmDTO {
	// 최초입력일시
	private String sysDate;
	// 작업자
	@Max(10)
	private String userId;
	// 최종변경일시
	private String updDate;
	// 병원(회원) ID
	@Max(10)
	private String hsptId;
	// 시스템ID            
	@Max(10)
	private String systemId;
	// 프로그램 ID      
	@Max(20)
	private String pgrmId;
	// 프로그램 명칭          
	@Max(100)
	private String pgrmName;
	// 프로그램 URL          
	@Max(200)
	private String pgrmUrl;
	// 프로그램 유형(화면유형)
	@Max(1)
	private String pgrmType;
	// 프로그램 호출방식()M : Main 화면 , P : 팝업화면
	@Max(1)
	private String pgrmInfo;
	// 사용여부
	@Max(1)
	private String useYn;
	// 완료여부
	@Max(1)
	private String endYn;
}