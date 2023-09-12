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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.model.RisBtnDTO;
import egovframework.com.service.ComService;

@Controller
public class RISBTNE00Controller {
	
	@Resource(name="ComService")
	private ComService comService;
	
	@RequestMapping(value = "/RISBTNE00.do")
	public String menu(Model model) throws Exception {
		return ".main/com/RISBTNE00";
	}
	
	@RequestMapping(value = "/RISBTNE00.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISBTNE00(@RequestParam String type, HttpSession session, HttpServletRequest request,
	        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISBTNE00.do POST!!!!");
		JSONObject json = new JSONObject(); 
		List<RisBtnDTO> data =comService.RisBtnList(); 
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}
}

