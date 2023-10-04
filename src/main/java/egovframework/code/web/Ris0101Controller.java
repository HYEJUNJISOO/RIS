package egovframework.code.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import egovframework.code.mapper.Ris0101Mapper;
import egovframework.code.model.Ris0101DTO;
import egovframework.code.model.Ris0102DTO;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.service.Ris0101Service;
import egovframework.code.service.Ris0102Service;
import egovframework.code.service.Ris0103Service;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class Ris0101Controller {
	@Resource(name="ris0101Service")
	private Ris0101Service ris0101Service;

	@Resource(name="ris0101Mapper")
	private Ris0101Mapper ris0101Mapper;

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

	// 공통코드 대분류 상세화면
	@RequestMapping(value = "/RIS0101E01.do")
	public String RIS0101E01(Model model,
							 @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
							 @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd,
							 Map<String, Object> requestMap) throws Exception {

		System.out.println("RIS0101E01 requestMap :::"+requestMap);
		ObjectMapper objectMapper = new ObjectMapper();
		requestMap.put("hspt_id",hsptId);
		requestMap.put("lrgc_cd",lrgcCd);

		List<Ris0101DTO> list = ris0101Service.findRis0101One(requestMap);

		requestMap.put("hsptId",requestMap.get("hspt_id"));
		requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));

		String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
		jsonString = jsonString.replaceAll("[\\['\\]]","");

		model.addAttribute("resultList", list);
		model.addAttribute("data", jsonString);
		return ".main/code/RIS0101E01";
	}

	// 공통코드 중분류 상세화면
	@RequestMapping(value = "/RIS0101E01M.do")
	public String RIS0101E01M(Model model,
							 @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
							 @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd,
							  @RequestParam(value="mddlCd", required=false, defaultValue="") String mddlCd,
							  @RequestParam(value="submitLMS", required=false, defaultValue="") String submitLMS,
							 Map<String, Object> requestMap) throws Exception {
		System.out.println("RIS0101E01M requestMap :::"+requestMap);
		ObjectMapper objectMapper = new ObjectMapper();
		requestMap.put("hspt_id",hsptId);
		requestMap.put("lrgc_cd",lrgcCd);
		requestMap.put("mddl_cd",mddlCd);

		List<Ris0102DTO> list = ris0101Service.findRis0102One(requestMap);
		requestMap.put("hsptId",requestMap.get("hspt_id"));
		requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));
		requestMap.put("mddlCd",requestMap.get("mddl_cd"));

		String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
		jsonString = jsonString.replaceAll("[\\['\\]]","");

		model.addAttribute("resultList", list);
		model.addAttribute("data", jsonString);
		return ".main/code/RIS0101E01M";
	}

	// 공통코드 소분류 상세화면
	@RequestMapping(value = "/RIS0101E01S.do")
	public String RIS0101E01S(Model model,
							  @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
							  @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd,
							  @RequestParam(value="mddlCd", required=false, defaultValue="") String mddlCd,
							  @RequestParam(value="smllCd", required=false, defaultValue="") String smllCd,
							  @RequestParam(value="submitLMS", required=false, defaultValue="") String submitLMS,
							  Map<String, Object> requestMap) throws Exception {
		System.out.println("RIS0101E01S requestMap :::"+requestMap);
		ObjectMapper objectMapper = new ObjectMapper();
		requestMap.put("hspt_id",hsptId);
		requestMap.put("lrgc_cd",lrgcCd);
		requestMap.put("mddl_cd",mddlCd);
		requestMap.put("smll_cd",smllCd);

		List<Ris0103DTO> list = ris0101Service.findRis0103One(requestMap);
		requestMap.put("hsptId",requestMap.get("hspt_id"));
		requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));
		requestMap.put("mddlCd",requestMap.get("mddl_cd"));
		requestMap.put("smllCd",requestMap.get("smll_cd"));

		String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
		jsonString = jsonString.replaceAll("[\\['\\]]","");

		model.addAttribute("resultList", list);
		model.addAttribute("data", jsonString);
		return ".main/code/RIS0101E01S";
	}

	// 공통코드 대,중,소분류 수정화면
	@RequestMapping(value = "/RIS0101E03.do")
	public String RIS0101E03(Model model,
							  @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
							  @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd,
							  @RequestParam(value="mddlCd", required=false, defaultValue="") String mddlCd,
							  @RequestParam(value="smllCd", required=false, defaultValue="") String smllCd,
							  @RequestParam(value="submitLMS", required=false, defaultValue="") String submitLMS,
							  Map<String, Object> requestMap,
							  ModelMap modelMap) throws Exception {
		System.out.println("RIS0101E03 requestMap :::"+requestMap);
		ObjectMapper objectMapper = new ObjectMapper();
		requestMap.put("hspt_id",hsptId);
		requestMap.put("lrgc_cd",lrgcCd);
		requestMap.put("mddl_cd",mddlCd);
		requestMap.put("smll_cd",smllCd);

		/*System.out.println("dataTT :::"+this.ris0101Mapper.findRis0101MapOne( requestMap ));*/

		if("L".equals(submitLMS)){
			List<Ris0101DTO> list = ris0101Service.findRis0101One(requestMap);
			requestMap.put("hsptId",requestMap.get("hspt_id"));
			requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));

			String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
			jsonString = jsonString.replaceAll("[\\['\\]]","");

			model.addAttribute("resultList", list);
			model.addAttribute("data", jsonString);
		}else if("M".equals(submitLMS)){
			List<Ris0102DTO> list = ris0101Service.findRis0102One(requestMap);
			requestMap.put("hsptId",requestMap.get("hspt_id"));
			requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));
			requestMap.put("mddlCd",requestMap.get("mddl_cd"));

			String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
			jsonString = jsonString.replaceAll("[\\['\\]]","");

			model.addAttribute("resultList", list);
			model.addAttribute("data", jsonString);
		}else if("S".equals(submitLMS)){
			List<Ris0103DTO> list = ris0101Service.findRis0103One(requestMap);
			requestMap.put("hsptId",requestMap.get("hspt_id"));
			requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));
			requestMap.put("mddlCd",requestMap.get("mddl_cd"));
			requestMap.put("smllCd",requestMap.get("smll_cd"));

			String jsonString = objectMapper.writeValueAsString(list); // 리스트 to json String
			jsonString = jsonString.replaceAll("[\\['\\]]","");

			model.addAttribute("resultList", list);
			model.addAttribute("data", jsonString);
		}
		model.addAttribute("checkLMS", submitLMS);
		return ".main/code/RIS0101E03";
	}

	// 공통코드 상세화면 ajax등록
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

	// 공통코드 상세화면 ajax수정
	@RequestMapping(value = "/risCodeUpdateData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeUpdateData(@RequestBody Map<String, Object> requestMap,
										@RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS
	) throws Exception {
		System.out.println("UPDATE requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = 0;
		System.out.println("checkLMS :::"+checkLMS);
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

	// 공통코드 상세화면 ajax삭제
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

	// 공통코드 중분류 ajax리스트
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

	// 공통코드 대분류 ajax리스트
	@RequestMapping(value = "/risCodeList1Search.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeList1Search(@RequestParam Map<String, Object> requestMap) throws Exception {
		JSONObject json = new JSONObject();
		List<Ris0101DTO> list = ris0101Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		return json;
	}

	// 공통코드 소분류 ajax리스트
	@RequestMapping(value = "/risCodeList3.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject risCodeList3(@RequestParam Map<String, Object> requestMap
	) throws Exception {
		System.out.println("requestMap risCodeList3 :::"+requestMap);
		if("".equals(requestMap.get("hsptId")) && requestMap.get("hsptId") == null){
			requestMap.put("hsptId",requestMap.get("hspt_id"));
		}else if(!"".equals(requestMap.get("hspt_id")) && requestMap.get("hspt_id") != null){
			requestMap.put("hsptId",requestMap.get("hspt_id"));
		}

		if("".equals(requestMap.get("lrgcCd")) && requestMap.get("lrgcCd") == null){
			requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));
		}else if(!"".equals(requestMap.get("lrgc_cd")) && requestMap.get("lrgc_cd") != null){
			requestMap.put("lrgcCd",requestMap.get("lrgc_cd"));
		}

		if("".equals(requestMap.get("mddlCd")) && requestMap.get("mddlCd") == null){
			requestMap.put("mddlCd",requestMap.get("mddl_cd"));
		}else if(!"".equals(requestMap.get("mddl_cd")) && requestMap.get("mddl_cd") != null){
			requestMap.put("mddlCd",requestMap.get("mddl_cd"));
		}

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

