package egovframework.com.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.service.ComService;

@Controller
public class RISMENUE00Controller {
	
	@Resource(name="ComService")
	private ComService comService;
	
	@RequestMapping(value = "/RISMENUE00.do")
	public String menu(Model model) throws Exception {
		return ".main/com/RISMENUE00";
	}
	
	@RequestMapping(value = "/RISMENUE00.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISMENUE00(@RequestParam String type, HttpSession session, HttpServletRequest request,
	        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISMENUE00.do POST!!!!");
		JSONObject json = new JSONObject(); 
		List<RisGrupDTO> data =comService.RisGrupList(); 
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}
	
	@RequestMapping(value = "/RISMENUE002.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISMENUE002(@RequestParam String type, HttpSession session, HttpServletRequest request,
	        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISMENUE002.do POST!!!!");
		JSONObject json = new JSONObject(); 
		List<RisGrmuDTO> data =comService.RisGrmuList(); 
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}
	
}

