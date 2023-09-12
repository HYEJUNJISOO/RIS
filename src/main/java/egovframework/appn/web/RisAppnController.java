package egovframework.appn.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RisAppnService;

@Controller
@RequestMapping("/appn")
public class RisAppnController {
	
	@Resource(name="risAppnService")
	private RisAppnService risAppnService;
	
	/*
	 * 예약 기준 관리
	 * GET		/appn/risappn/ris0210.do	
	 */
	@GetMapping("/risappn.do")
	public String risappnGetMapping() {
		System.out.println("/risappn.do Get Request!!!");
		
		return ".main/appn/RIS0201E00";
	}
	
	/*
	 * 예외 기준 관리
	 * GET		/appn/ris0213List.do	WEB-INF/appn/RIS0213E00.jsp forward
	 */
	
	@GetMapping("/ris0213List.do")
	public String ris0213ListGetMapping() {
		System.out.println("/ris0213List.do Get Request!!!");
		return ".main/appn/RIS0213E00";
	}
	
	/*
	 * 휴일 기준 관리
	 * GET		/appn/ris0212List.do	WEB-INF/appn/RIS0212E00.jsp forward
	 */
	
	@GetMapping("/ris0212List.do")
	public String ris0212ListGetMapping() {
		System.out.println("ris0212List.do Get Mapping!!!");		
		return ".main/appn/RIS0212E00";
	}
	
	/*
	 * 예약 관리 페이지!
	 * GET		/appn/RIS1211E00.do	WEB-INF/appn/RIS1211E00.jsp forward
	 */
	
	@GetMapping("/ris1211e00.do")
	public String ris1211e00GetMapping() {
		System.out.println("/ris1211e00.do Get Mapping!!!");
		return ".main/appn/RIS1211E00";
	}
	
	
	
}
