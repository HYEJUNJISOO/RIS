package egovframework.exam;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.exam.mapper.TestsMapper;



@Controller
public class BugController {
	@Resource(name="TestMapper2")
	private TestsMapper testMapper2;
	
	@GetMapping("/aaa.do")
	public String hello() {
		System.out.println("hello");
		return ".main/test";
	}
	
	@GetMapping("/bbb.do")
	public String hello2() {
		System.out.println("hello2");
		int size = testMapper2.findAll();
		System.out.println("데이터의 사이즈 : " + size);
		return ".main/test";
	}

	@GetMapping("/ccc.do")
	public String hello3() {
		return ".main/code/risCodeList";
	}
	
	@GetMapping("/oneGrid.do")
	public String oneGrid() {
		return ".main/oneGrid";
	}

	@GetMapping("/twoGrid.do")
	public String twoGrid() {
		return ".main/twoGrid";
	}

	@GetMapping("/threeGrid.do")
	public String threeGrid() {
		return ".main/threeGrid";
	}
}
