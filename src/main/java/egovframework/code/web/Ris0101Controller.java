package egovframework.code.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import egovframework.code.model.Ris0101DTO;
import egovframework.code.model.Ris0102DTO;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.service.Ris0101Service;
import egovframework.code.service.Ris0102Service;
import egovframework.code.service.Ris0103Service;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class Ris0101Controller {
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

		List<Ris0101DTO> list = ris0101Service.findOne(requestMap);

		requestMap.put("hsptId",requestMap.get("hspt_id"));
		requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));

		String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
		jsonString = jsonString.replaceAll("[\\['\\]]","");

		model.addAttribute("resultList", list);
		model.addAttribute("data", jsonString);
		return ".main/code/RIS0101E01";
	}

	// 공통코드 상세화면 등록
	@RequestMapping(value = "/risCodeInsertData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeInsertData(@RequestBody Map<String, Object> requestMap,
										@RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS
	) throws Exception {
		System.out.println("INSERT requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = 0;
		if("L".equals(checkLMS) && "I".equals(requestMap.get("iud"))){
			result = ris0101Service.insertRis0101Data(requestMap);
		}else if("M".equals(checkLMS) && "I".equals(requestMap.get("iud"))){
			result = ris0101Service.insertRis0102Data(requestMap);
		}else if("S".equals(checkLMS) && "I".equals(requestMap.get("iud"))){
			result = ris0101Service.insertRis0103Data(requestMap);
		}
		json.put("error_code", 0);
		return json;
	}

	// 공통코드 상세화면 수정
	@RequestMapping(value = "/risCodeUpdateData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeUpdateData(@RequestBody Map<String, Object> requestMap,
										@RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS
	) throws Exception {
		System.out.println("UPDATE requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = 0;
		if("L".equals(checkLMS) && "U".equals(requestMap.get("iud"))){
			result = ris0101Service.updateRis0101Data(requestMap);
		}else if("M".equals(checkLMS) && "U".equals(requestMap.get("iud"))){
			result = ris0101Service.updateRis0102Data(requestMap);
		}else if("S".equals(checkLMS) && "U".equals(requestMap.get("iud"))){
			result = ris0101Service.updateRis0103Data(requestMap);
		}
		json.put("error_code", 0);
		return json;
	}

	// 공통코드 상세화면 삭제
	@RequestMapping(value = "/risCodeDeleteData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeDeleteData(@RequestBody Map<String, Object> requestMap,
										@RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS,
										@RequestParam(value="lrgc_cd", required=false, defaultValue="") String lrgc_cd,
										@RequestParam(value="mddl_cd", required=false, defaultValue="") String mddl_cd,
										@RequestParam(value="smll_cd", required=false, defaultValue="") String smll_cd
	) throws Exception {
		System.out.println("DELETE requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = 0;
		if("L".equals(checkLMS)){
			result = ris0101Service.deleteRis0101Data(requestMap);
		}else if("M".equals(checkLMS)){
			result = ris0101Service.deleteRis0102Data(requestMap);
		}else if("S".equals(checkLMS)){
			result = ris0101Service.deleteRis0103Data(requestMap);
		}
		json.put("error_code", 0);

		return json;
	}

	// 공통코드 등록화면
	@RequestMapping(value = "/RIS0101E02.do")
	public String RIS0101E02(Model model) throws Exception {
		return ".main/code/RIS0101E02";
	}

	// 공통코드 중분류 리스트
	@RequestMapping(value = "/risCodeList2.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeList2(@RequestParam Map<String, Object> requestMap,
								   @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
								   @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd
	) throws Exception {
		requestMap.put("hsptId",hsptId);
		requestMap.put("lrgcCd",lrgcCd);

		JSONObject json = new JSONObject();
		List<Ris0102DTO> list = ris0102Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		System.out.println("json2 :::"+json);
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
	public JSONObject risCodeList3(@RequestParam Map<String, Object> requestMap
	) throws Exception {
		requestMap.put("hsptId",requestMap.get("hspt_id"));
		requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));
		requestMap.put("mddlCd",requestMap.get("mddl_cd"));
		JSONObject json = new JSONObject();
		List<Ris0103DTO> list = ris0103Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		return json;
	}

	// 공통코드 등록시 중복체크
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

