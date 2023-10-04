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
	public String RIS0102E00(Model model) throws Exception {
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

		System.out.println("requestMap0102 :::"+requestMap);

		JSONObject json = new JSONObject();
		List<Ris0102DTO> list = ris0102Service.findRis0102List(requestMap); // 중분류 코드 리스트 데이터
		json.put("rows", list);
		System.out.println("list1 :::"+list);
		System.out.println("hsptId :::"+hsptId);
		System.out.println("lrgcCd :::"+lrgcCd);
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

		System.out.println("hsptId :::"+hsptId);
		System.out.println("lrgcCd :::"+lrgcCd);
		System.out.println("mddlCd :::"+mddlCd);

		JSONObject json = new JSONObject();
		Ris0102DTO list = ris0102Service.findRis0102View(requestMap); // 중분류 코드 리스트 데이터
		json.put("rows", list);
		System.out.println("list :::"+list);

		return json;
	}

}

