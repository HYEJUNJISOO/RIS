package egovframework.code.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import egovframework.code.model.Ris0101DTO;
import egovframework.code.model.Ris0102DTO;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.model.Ris0109DTO;
import egovframework.code.service.Ris0101Service;
import egovframework.code.service.Ris0102Service;
import egovframework.code.service.Ris0103Service;
import egovframework.code.service.Ris0109Service;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class Ris0109Controller {
	@Resource(name="ris0101Service")
	private Ris0101Service ris0101Service;

	@Resource(name="ris0102Service")
	private Ris0102Service ris0102Service;

	@Resource(name="ris0103Service")
	private Ris0103Service ris0103Service;

	@Resource(name="ris0109Service")
	private Ris0109Service ris0109Service;

	// 기준정보입력관리 리스트
	@RequestMapping(value = "/RIS0109E00.do")
	public String RIS0109E00(Model model) throws Exception {
		return ".main/code/RIS0109E00";
	}

	// 0109 ajax리스트
	@RequestMapping(value = "/RIS0109E00List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0109E00List(@RequestParam Map<String, Object> requestMap
	) throws Exception {
		System.out.println("requestMap RIS0109E00List :::"+requestMap);
		JSONObject json = new JSONObject();
		List<Ris0109DTO> list = ris0109Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		return json;
	}

	// 공통코드 대분류 ajax리스트
	@RequestMapping(value = "/RIS0109E00CodeList.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0109E00CodeList(@RequestParam Map<String, Object> requestMap
	) throws Exception {
		System.out.println("requestMap RIS0109E00CodeList :::"+requestMap);
		JSONObject json = new JSONObject();
		requestMap.put("hspt_id","A001");
		List<Ris0101DTO> list = ris0101Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		return json;
	}

	// 공통코드 중분류 ajax리스트
	@RequestMapping(value = "/RIS0109E00CodeList2.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0109E00CodeList2(@RequestParam Map<String, Object> requestMap,
								   @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
								   @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd
	) throws Exception {
		requestMap.put("hsptId",hsptId);
		requestMap.put("lrgcCd",lrgcCd);
		System.out.println("requestMap RIS0109E00CodeList2 :::"+requestMap);

		JSONObject json = new JSONObject();
		List<Ris0102DTO> list = ris0102Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);

		return json;
	}

	// 공통코드 소분류 ajax리스트
	@RequestMapping(value = "/RIS0109E00CodeList3.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0109E00CodeList3(@RequestParam Map<String, Object> requestMap
	) throws Exception {
		System.out.println("requestMap RIS0109E00CodeList3 :::"+requestMap);

		JSONObject json = new JSONObject();
		List<Ris0103DTO> list = ris0103Service.findAll(requestMap); // 대분류 코드 리스트 데이터
		json.put("rows", list);
		return json;
	}

	// 공통코드 상세화면 ajax등록
	@RequestMapping(value = "/RIS0109E00EditData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0109E00EditData(@RequestBody Map<String, Object> requestMap,
										   @RequestParam(value="checkLMS", required=false, defaultValue="") String checkLMS
	) throws Exception {
		System.out.println("RIS0109E00EditData requestMap :::"+requestMap);
		JSONObject json = new JSONObject();
		json.put("result", "true");
		requestMap.put("hspt_id","A001");
		int result = 0;

		if("I".equals(requestMap.get("iud"))){
			result = ris0109Service.insertRis0109Data(requestMap);
		}else if("U".equals(requestMap.get("iud"))){
			result = ris0109Service.updateRis0109Data(requestMap);
		}else if("D".equals(requestMap.get("iud"))){
			result = ris0109Service.deleteRis0109Data(requestMap);
		}

		json.put("error_code", 0);
		return json;
	}

}

