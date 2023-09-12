package egovframework.pandok.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris0601DTO;
import egovframework.pandok.model.RisUserDTO;
import egovframework.pandok.service.PandokService;

@Controller
public class PandokController {
	@Resource(name="PandokService")
	PandokService pandokService;
	
	@RequestMapping(value = "/pandok/ris0601List.do")
	public String ris0601ListPage(Model model) throws Exception {
		// 페이지 이동 시 model에 데이터를 넣어서 이동
		List<Ris0102DTO> ris0102Data = pandokService.getRis0102List();
		ObjectMapper objectMapper = new ObjectMapper();

		try {
		    String ris0102ListJson = objectMapper.writeValueAsString(ris0102Data);
		    
		    // 기존 List<DTO> 형태 데이터
		    model.addAttribute("ris0102Data", ris0102Data);
		    // JS에서 사용하기 위한 변환된 JSON 데이터
		    model.addAttribute("ris0102List", ris0102ListJson);
		} catch (Exception e) {
		    // 예외 처리
		}
		
		List<RisUserDTO> risUserData = pandokService.getRisUserList();
		
		try {			
			model.addAttribute("risUserData", risUserData);
		} catch (Exception e) {
			// 예외 처리
		}
		
		return ".main/pandok/RIS0601E00";
	}
	
	@RequestMapping(value = "/pandok/getRis0601List.do")
	@ResponseBody
	public JSONObject getRis0601List(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		List<Ris0601DTO> ris0601Data = pandokService.getRis0601List();
		
		// System.out.println(ris0601Data);

		json.put("ris0601Data", ris0601Data);
		
		return json;
	}
}