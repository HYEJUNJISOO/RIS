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
 public class Ris0201DTO {
     @NotBlank
     @Size(max = 20)
     private String hsptId;
     @NotBlank
     @Size(max = 20)
     private String imgnCd;
     private String imgn_cd;
     private String imgnKrNm;
     private String imgnEnglNm;
     private String imgnAbbrNm;
     private String imgnDvsnCd;
     private String prtbImgnYn;
     private String imgnRoomCd;
     private String inptImgnRoomCd;
     private String imgnBdypCd;
     private String sttsBdypCd;
     private String imgnDrctCd;
     private String imgnCnt;
     private String infoFormCd;
     private String outpAppnYn;
     private String inptAppnYn;
     private String elctTrtmYn;
     private String otptSqnc;
     private String exprDate;
     private String ordrCd;
     private String rgstId;
     private LocalDateTime rgstDttm;
     private String mdfcId;
     private LocalDateTime mdfcDttm;
 }