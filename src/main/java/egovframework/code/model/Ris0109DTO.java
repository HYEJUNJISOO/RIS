package egovframework.code.model;

import lombok.*;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotBlank;

import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Ris0109DTO {
	@NotBlank
	@Size(max = 20)
	private String hsptId; 
	@NotBlank
	@Size(max = 20)
	private String lrgcCd;
	private String clmnNm;
	private String applKrNm;
	private String applEnglNm;
	private String clmnApplDvsn;
	private String iputNm1;
	private String iputNm2;
	private String iputNm3;
	private String iputNm4;
	private String iputNm5;
	private String iputVlue1;
	private String iputVlue2;
	private String iputVlue3;
	private String iputVlue4;
	private String iputVlue5;
	private String elctLrgcCd;
	private String rqrdYn;
	private String rgstId;
	private LocalDateTime rgstDttm;
	private String mdfcId;
	private LocalDateTime mdfcDttm;
}