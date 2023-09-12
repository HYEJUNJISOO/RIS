 package egovframework.code.model;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;

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
public class Ris0101DTO {
	@NotBlank
	@Size(max = 20)
	private String hsptId; 
	@NotBlank
	@Size(max = 20)
	private String lrgcCd;
	private String lrgc_cd;
	private String lrgcKrNm;
	private String lrgcEnglNm;
	private String lrgc_engl_nm;
	private String lrgcAbbrNm;
	private String lrgcAcph;
	private Integer otptSqnc;
	private String applDate;
	private String exprDate;
	private String chrc1;
	private String chrc2;
	private String chrc3;
	private String chrc4;
	private String chrc5;
	private String nmbr1;
	private String nmbr2;
	private String nmbr3;
	private String nmbr4;
	private String nmbr5;
	private String rgstId;
	private LocalDateTime rgstDttm;
	private String mdfcId;
	private LocalDateTime mdfcDttm;
}