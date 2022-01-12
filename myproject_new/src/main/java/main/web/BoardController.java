package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.EgovSampleExcepHndlr;
import main.service.BoardService;
import main.service.BoardVO;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	private final String MODULE ="board";

	@Resource(name="boardService")
	private BoardService boardService;
	
	@GetMapping("/boardWrite.do")
	public String boardWrite() {
		LOGGER.info("-------------------------------boardWrite  ");
		return MODULE+"/boardWrite";
	}
	
	@ResponseBody
	@PostMapping("/boardWrite.do")
	public String boardWriteSave(BoardVO vo) throws Exception {
		LOGGER.info("-------------------------------boardWriteSave vo:"+ vo);
		String result = boardService.insertNBoard(vo);
		String msg = "";
		if(result == null) {
			msg="ok";
			LOGGER.info("-------------------------------저장성공 ");
		} else {
			msg="fail";
		}
		return msg;
	}
	
	@GetMapping("/boardList.do")
	public String boardList(BoardVO vo, Model model) throws Exception {
		// 총 데이터 개수
		int total = boardService.selectNBoardCount(vo);
		
		// 총 페이지 개수
		//(double)12/10 -> ceil(1.2) -> Integer(2.0) -> 2   : 1.2를 올림처리하여 페이지수를 구한다.
		int totalPage = (int)Math.ceil((double)total/10);
		
		
		model.addAttribute("totalRow",total);		
		List<?> list = boardService.selectNBoard(vo);
		model.addAttribute("resultList", list);
		LOGGER.info("-------------------------------boardList :"+ list);		
		return MODULE+"/boardList";
	}
	
	
}
