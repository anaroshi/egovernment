package main.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.EgovSampleExcepHndlr;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	private final String MODULE = "member";
	
//	@Resource(name="memberService")
//	private MemberService memberService;
	
	/*  
	 * 회원등록화면
	 */
	@GetMapping("/memberWrite.do")
	public String memberWrite() {
		LOGGER.info("-------------------------------memberWrite  ");
		return MODULE+"/memberWrite";
	}
	
	

}
