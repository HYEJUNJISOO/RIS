package egovframework.com.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibatis.common.logging.Log;

import egovframework.com.model.RisUserDTO;
import egovframework.com.service.ComService;


@Controller
public class RISUSERQ00Controller {
	
	@Resource(name="ComService")
	private ComService comService;
	
	
	@RequestMapping(value = "/RISUSERQ00.do")
	public String menu(Model model) throws Exception {
		System.out.print("=====123123123==");
		return ".main/com/RISUSERQ00";
	}
	
	@RequestMapping(value = "/RISUSERQ00.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISUSERQ00(@RequestParam String type, HttpSession session, HttpServletRequest request,
        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISUSERQ00.do POST!!!!");
		JSONObject json = new JSONObject(); 
		List<RisUserDTO> data =comService.RisUserList(); 
		for(RisUserDTO dto : data) {
			System.out.println(dto.getLoginId());
		}
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}
}

