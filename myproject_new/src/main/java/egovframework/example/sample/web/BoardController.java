package egovframework.example.sample.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.EgovSampleExcepHndlr;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	private final String MODULE ="board";

	
	@GetMapping("/boardWrite.do")
	public String boardWrite() {
		LOGGER.info("-------------------------------boardWrite  ");
		return MODULE+"/boardWrite";
	}
	
	
}
