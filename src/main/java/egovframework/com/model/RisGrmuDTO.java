package egovframework.com.model;
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
public class RisGrmuDTO {
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
	@Max(10)
	private String menuGroupId;
	// 메뉴 ID  
	@Max(20)
	private String menuId;
	// 프로그램 ID     
	@Max(20)
	private String pgrmId;
	// 상위메뉴 ID
	@Max(20)
	private String upperMenuId;
	// 메뉴LEVEL
	@Max(10)
	private String menuLevel;
	// 메뉴명
	@Max(50)
	private String menuName;
	// 정렬순서
	@Max(11)
	private String otptSqnc;
	// 사용여부
	@Max(1)
	private String useYn;
	// 메뉴명 SUB
	@Max(50)
	private String menuNameSub;
}