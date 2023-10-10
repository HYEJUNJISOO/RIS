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
public class Ris0102Controller {
	@Resource(name="ris0101Service")
	private Ris0101Service ris0101Service;

	@Resource(name="ris0102Service")
	private Ris0102Service ris0102Service;

	//촬영장비관리 관리화면
	@RequestMapping(value = "/RIS0102E00.do")
	public String RIS0102E00(Model model,Map<String, Object> requestMap) throws Exception {

		requestMap.put("hsptId","A001");
		requestMap.put("lrgcCd","IMGN_ROOM_CD");
		List<Ris0102DTO> list = ris0102Service.findRis0102List(requestMap); // 중분류 코드 리스트 데이터
		model.addAttribute("resultList", list);
		return ".main/code/RIS0102E00";
	}

	// 공통코드 중분류 ajax리스트
	@RequestMapping(value = "/RIS0102E00List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0102E00List(@RequestParam Map<String, Object> requestMap,
								   @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
								   @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd
	) throws Exception {
		requestMap.put("hsptId",hsptId);
		requestMap.put("lrgcCd",lrgcCd);
		if(!"".equals(requestMap.get("search_mddl_cd")) && requestMap.get("search_mddl_cd") != null){
			requestMap.put("search_mddl_cd",requestMap.get("search_mddl_cd"));
		}
		System.out.println("RIS0102E00List requestMap :::"+requestMap);

		JSONObject json = new JSONObject();
		List<Ris0102DTO> list = ris0102Service.findRis0102List(requestMap); // 중분류 코드 리스트 데이터
		json.put("rows", list);
		return json;
	}

	// 공통코드 중분류 ajax리스트
	@RequestMapping(value = "/RIS0102E00View.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0102E00View(@RequestParam Map<String, Object> requestMap,
									 @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
									 @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd,
									 @RequestParam(value="mddlCd", required=false, defaultValue="") String mddlCd
	) throws Exception {
		requestMap.put("hsptId",hsptId);
		requestMap.put("lrgcCd",lrgcCd);
		requestMap.put("mddlCd",mddlCd);
		System.out.println("RIS0102E00View requestMap :::"+requestMap);

		JSONObject json = new JSONObject();
		Ris0102DTO list = ris0102Service.findRis0102View(requestMap); // 중분류 코드 리스트 데이터
		json.put("rows", list);

		return json;
	}

	// 공통코드 상세화면 ajax등록
	@RequestMapping(value = "/RIS0102E00InsertData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0102E00InsertData(@RequestBody Map<String, Object> requestMap,
										@RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS
	) throws Exception {
		System.out.println("INSERT requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = 0;
		if("M".equals(checkLMS) && "I".equals(requestMap.get("iud"))){
			result = ris0101Service.insertRis0102Data(requestMap);
		}
		json.put("error_code", 0);
		return json;
	}

	// 공통코드 상세화면 ajax수정
	@RequestMapping(value = "/RIS0102E00UpdateData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0102E00UpdateData(@RequestBody Map<String, Object> requestMap,
										@RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS
	) throws Exception {
		System.out.println("UPDATE requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = 0;
		System.out.println("checkLMS :::"+checkLMS);
		if("M".equals(checkLMS) && "U".equals(requestMap.get("iud")) || "D".equals(requestMap.get("iud"))){
			result = ris0101Service.updateRis0102Data(requestMap);
		}
		json.put("error_code", 0);
		return json;
	}

	// 공통코드 상세화면 ajax삭제
	@RequestMapping(value = "/RIS0102E00DeleteData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0102E00DeleteData(@RequestBody Map<String, Object> requestMap,
										@RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS,
									    @RequestParam(value="hspt_id", required=false, defaultValue="") String hspt_id,
										@RequestParam(value="lrgc_cd", required=false, defaultValue="") String lrgc_cd,
										@RequestParam(value="mddl_cd", required=false, defaultValue="") String mddl_cd
	) throws Exception {
		requestMap.put("hspt_id",hspt_id);
		requestMap.put("lrgc_cd",lrgc_cd);
		requestMap.put("mddl_cd",mddl_cd);
		System.out.println("DELETE requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		int result = 0;
		if("M".equals(checkLMS)){
			result = ris0101Service.deleteRis0102Data(requestMap);
		}
		json.put("error_code", 0);
		return json;
	}

	// 공통코드 등록시 중복체크
	@RequestMapping(value = "/RIS0102E00DuplicateCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0102E00DuplicateCheck(@RequestParam Map<String, Object> requestMap,
											   @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
											   @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd,
											   @RequestParam(value="mddlCd", required=false, defaultValue="") String mddlCd
	) throws Exception {
		requestMap.put("hsptId",hsptId);
		requestMap.put("lrgcCd",lrgcCd);
		requestMap.put("mddlCd",mddlCd);
		System.out.println("RIS0102E00DuplicateCheck requestMap:::"+requestMap);
		int result = 0;
		JSONObject json = new JSONObject();

		result = ris0102Service.RIS0102E00DuplicateCheck(requestMap); // 대분류 코드 리스트 데이터
		json.put("result", result);
		if(result > 0){
			json.put("error_code", 1);
		}else{
			json.put("error_code", 0);
		}
		return json;
	}

}

