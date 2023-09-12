package egovframework.jubsu.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JubsuController {
	
	// 영상 접수 관리 페이지
	@RequestMapping(value = "/jubsu/RIS1201E00.do")
	private String RIS1201E00(Model model) throws Exception {
		return ".main/jubsu/RIS1201E00";
	}
	
	// 이동 촬영 접수 페이지
	@RequestMapping(value = "/jubsu/RIS1201E02.do")
	private String RIS1201E02(Model model) throws Exception {
		return ".main/jubsu/RIS1201E02";
	}
	
	// 처방 정보 관리 페이지
	@RequestMapping(value = "/jubsu/RIS1201E03.do")
	private String RIS1201E03(Model model) throws Exception {
		return ".main/jubsu/RIS1201E03";
	}
	
	// 영상 실시 관리 페이지
	@RequestMapping(value = "/jubsu/RIS1201E04.do")
	private String RIS1201E04(Model model) throws Exception {
		return ".main/jubsu/RIS1201E04";
	}
	
}



