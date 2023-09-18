package egovframework.code.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.code.model.Ris0101DTO;
import egovframework.code.model.Ris0102DTO;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.service.Ris0101Service;
import egovframework.code.service.Ris0102Service;
import egovframework.code.service.Ris0103Service;

@Controller
public class CodeController {
	@Resource(name="ris0101Service")
	private Ris0101Service ris0101Service;

	@Resource(name="ris0102Service")
	private Ris0102Service ris0102Service;

	@Resource(name="ris0103Service")
	private Ris0103Service ris0103Service;
	
	// 공통코드 리스트
	@RequestMapping(value = "/RIS0101E00.do")
	public String RIS0101E00(Model model, Map<String, Object> requestMap) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println("requestMap :::"+requestMap);
		List<Ris0101DTO> list = ris0101Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		
		String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
		
		model.addAttribute("data", jsonString);
		return ".main/code/RIS0101E00";
	}

	// 공통코드 상세화면
	@RequestMapping(value = "/RIS0101E01.do")
	public String RIS0101E01(Model model,
	 	@RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
		@RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd,
		Map<String, Object> requestMap) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();
		requestMap.put("hspt_id",hsptId);
		requestMap.put("lrgc_cd",lrgcCd);

		System.out.println("requestMap :::"+requestMap);
		List<Ris0101DTO> list = ris0101Service.findOne(requestMap);

		String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
		System.out.println("jsonString1 :::"+jsonString);
		jsonString = jsonString.replaceAll("[\\['\\]]","");
		System.out.println("jsonString2 :::"+jsonString);

		model.addAttribute("data", jsonString);
		return ".main/code/RIS0101E01";
	}

	// 공통코드 등록화면
	@RequestMapping(value = "/RIS0101E02.do")
	public String RIS0101E02(Model model) throws Exception {
		return ".main/code/RIS0101E02";
	}
	
	// ?
	@RequestMapping(value = "/RIS0109E00.do")
	public String RIS0109E00(Model model) throws Exception {
		return ".main/code/RIS0109E00";
	}
	
	//촬영실 관리화면
	@RequestMapping(value = "/RIS0102E00.do")
	public String RIS0102E00(Model model) throws Exception {
		return ".main/code/RIS0102E00";
	}
	
	// 공통코드 중분류 리스트
	@RequestMapping(value = "/risCodeList2.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeList2(@RequestParam Map<String, Object> requestMap) throws Exception {
		System.out.println("requestMapT :::"+requestMap);
		JSONObject json = new JSONObject();
		List<Ris0102DTO> list = ris0102Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		
		return json;
	}
	
	// 공통코드 소분류 리스트
	@RequestMapping(value = "/risCodeList1Search.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeList1Search(@RequestParam Map<String, Object> requestMap) throws Exception {
		JSONObject json = new JSONObject();
		List<Ris0101DTO> list = ris0101Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		
		return json;
	}

	// 공통코드 소분류 리스트
	@RequestMapping(value = "/risCodeList3.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeList3(@RequestParam Map<String, Object> requestMap) throws Exception {
		JSONObject json = new JSONObject();
		List<Ris0103DTO> list = ris0103Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		
		return json;
	}
	
	@RequestMapping(value = "/risCodeInsertData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeInsertData(@RequestBody Map<String, Object> requestMap) throws Exception {
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = ris0101Service.insertRis0101Data(requestMap); // 대분류 코드 리스트 데이터

		return json;
	}

	@RequestMapping(value = "/codeDuplicateCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject codeDuplicateCheck(@RequestParam Map<String, Object> requestMap) throws Exception {
		int result = 0;
		JSONObject json = new JSONObject();
		
		result = ris0101Service.codeDuplicateCheck(requestMap); // 대분류 코드 리스트 데이터
		json.put("result", result);
		
		return json;
	}
	
}

