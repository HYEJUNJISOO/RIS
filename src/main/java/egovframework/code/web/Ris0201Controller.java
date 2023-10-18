package egovframework.code.web;

import egovframework.code.model.Ris0101DTO;
import egovframework.code.model.Ris0102DTO;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.service.Ris0101Service;
import egovframework.code.service.Ris0102Service;
import egovframework.code.service.Ris0103Service;
import egovframework.code.service.Ris0201Service;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class Ris0201Controller {
	@Resource(name="ris0101Service")
	private Ris0101Service ris0101Service;

	@Resource(name="ris0102Service")
	private Ris0102Service ris0102Service;

	@Resource(name="ris0103Service")
	private Ris0103Service ris0103Service;

	@Resource(name="ris0201Service")
	private Ris0201Service ris0201Service;

	// 촬영코드관리 리스트
	@RequestMapping(value = "/RIS0201E00.do")
	public String RIS0201E00(Model model) throws Exception {
		return ".main/code/RIS0201E00";
	}

	// 촬영코드 ajax리스트
	@RequestMapping(value = "/RIS0201E00List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0201E00List(@RequestParam Map<String, Object> requestMap,
									 @RequestParam(value="hsptId", required=false, defaultValue="") String hsptId,
									 @RequestParam(value="lrgcCd", required=false, defaultValue="") String lrgcCd
	) throws Exception {
		requestMap.put("hsptId",hsptId);
		requestMap.put("lrgcCd",lrgcCd);

		System.out.println("RIS0102E00List requestMap :::"+requestMap);

		JSONObject json = new JSONObject();
		List<Ris0102DTO> list = ris0102Service.findRis0102List(requestMap); // 중분류 코드 리스트 데이터
		json.put("rows", list);
		return json;
	}


	// 촬영코드 상세화면 ajax등록
	@RequestMapping(value = "/RIS0201E00InsertData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0201E00InsertData(@RequestBody Map<String, Object> requestMap,
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

	// 촬영코드 상세화면 ajax수정
	@RequestMapping(value = "/RIS0201E00UpdateData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0201E00UpdateData(@RequestBody Map<String, Object> requestMap,
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

	// 촬영코드 상세화면 ajax삭제
	@RequestMapping(value = "/RIS0201E00DeleteData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS0201E00DeleteData(@RequestBody Map<String, Object> requestMap,
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

}

