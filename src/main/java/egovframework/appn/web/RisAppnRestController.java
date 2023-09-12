package egovframework.appn.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RisAppnService;

@RestController
@RequestMapping("/appn")
public class RisAppnRestController {
	
	@Resource(name="risAppnService")
	private RisAppnService risAppnService;
	
	/*
	 * 예약 기준 관리
	 * GET		/appn/risappn/ris0210.do	ris0210 조건에 맞는 조회
	 * POST									ris0210 새로운 Data 저장
	 * PATCH								ris0210 기존 Data 수정
	 * DELETE								ris0210 기존 Data 삭제
	 */
	
	@GetMapping("/risappn/ris0210.do")
	public ResponseEntity<?> risappnGetMapping() {
		System.out.println("/appn/risappn/ris0210.do	 Get Mapping!!!");

		return ResponseEntity.ok().body("");
	}
	
	
	/*
	 * 예외 기준 관리
	 * GET		/appn/ris0213List/ris0213.do	ris0213 조건에 맞는 조회
	 * POST										ris0213 새로운 Data 저장
	 * PATCH									ris0213 기존 Data 수정
	 * DELETE									ris0213 기존 Data 삭제
	 */
	
	@GetMapping("/ris0213List/ris0213.do")
	public ResponseEntity<?> ris0213ListGetMapping() {
		System.out.println("/ris0213List/ris0213.do Get Mapping!!!");
		List<Ris0213DTO> rows = risAppnService.ris0213FindAll();
		
		return ResponseEntity.ok().body(rows);
	}
	
	
	/*
	 * 휴일 기준 관리
	 * GET		/appn/ris0212List/ris0212.do	ris0212 Data를 전체 조회
	 * POST										ris0212List 새로운 Data 저장
	 * PATCH									ris0212List 기존 Data 수정
	 * DELETE									ris0212List 기존 Data 삭제
	 */
	
	@GetMapping("/ris0212List/ris0212.do")
	public ResponseEntity<?> ris0212ListGetMapping() {
		System.out.println("/appn/ris0212List/ris0212.do Get Mapping!!!");
		List<Ris0212DTO> rows = risAppnService.ris0212FindAll();
		
		return ResponseEntity.ok().body(rows);
	}
	
	/*
	 * 예약 관리 페이지!
	 * GET		/appn/ris1211e00/ris0211.do		ris0211 조건에 맞는 조회
	 * POST										ris0211 새로운 Data 저장
	 * PATCH									ris0211 기존 Data 수정
	 * DELETE									ris0211 기존 Data 삭제
	 */
	
	@GetMapping("/ris1211e00/ris0211.do")
	public ResponseEntity<?> ris1211e00GetMapping() {
		System.out.println("appn/ris1211e00/ris0211.do Get Mapping!!!");
		
		return ResponseEntity.ok().body("");
	}
	
}
