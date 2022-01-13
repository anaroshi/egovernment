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
	
	@PostMapping("/boardWriteSave.do")
	@ResponseBody
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
	
	@RequestMapping("/boardList.do")
	public String boardList(BoardVO vo, Model model) throws Exception {
		LOGGER.info("-------------------------------boardList vo:"+ vo);	
		int unit = vo.getUnit();
		// 사용자에 의해 한페이지당 글 수의 범위값에 해당되지 않는 수가 들어오면 10으로 정한다.
		if(unit<10) { unit= 10; }
		
		// 총 데이터 개수
		int total = boardService.selectNBoardCount(vo);
		
		// 총 페이지 개수
		//(double)12/10 -> ceil(1.2) -> Integer(2.0) -> 2   : 1.2를 올림처리하여 페이지수를 구한다.
		int totalPage = (int)Math.ceil((double)total/unit);
		
		// 현재 페이지 번호
		int viewPage = vo.getViewPage();
		
		// 사용자에 의해 페이지 범위값에 해당되지 않는 페이지가 들어오면 1페이지로 정한다.
		if(viewPage>totalPage || viewPage <1) {
			viewPage= 1;
		}
		
		// 1->1,10 // 2->11,20 // 3->21,30
		// startIndex : (1-1)*10 + 1 -> 1
		// startIndex : (2-1)*10 + 1 -> 11
		int startIndex	= ((viewPage-1)*unit) + 1; 
		int endIndex	= startIndex + (unit-1);
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		// 행번호 시작번호 구하기
		// total -> 34
		// 1p -> 34, 2p -> 24, 3p -> 14, 4p -> 4
		// p1 = total - 0;
		// p2 = total - 10;				
		int startRowNo = total - ((viewPage-1)*unit); 
		
		model.addAttribute("unit",unit);		
		model.addAttribute("totalRow",total);		
		model.addAttribute("totalPage",totalPage);		
		model.addAttribute("rowNunmer",startRowNo);		
		List<?> list = boardService.selectNBoard(vo);
		model.addAttribute("resultList", list);
		LOGGER.info("-------------------------------boardList :"+ list);		
		return MODULE+"/boardList";
	}
	
	@GetMapping("/boardDetail.do")
	public String boardDetail(BoardVO vo, Model model, int cnt) throws Exception {
		LOGGER.info("-------------------------------boardDetail vo:"+ vo);
		if(cnt==1) boardService.updateHits(vo);
		LOGGER.info("-------------------------------boardDetail int cnt:"+ cnt);
		BoardVO result = boardService.selectNBoardDetail(vo.getUnq());
		
		// 게시판 본문 내용에 줄바꿈 "\n" ---> "<br>"으로 바꿈
		String content = result.getContent();
		result.setContent(content.replace("\n", "<br>"));
		
		model.addAttribute("vo", result);
		return MODULE+"/boardDetail";
	}
	
	@GetMapping("/boardModifyWrite.do")
	public String boardModifyWrite(BoardVO vo, Model model) throws Exception {
		LOGGER.info("-------------------------------boardModifyWrite");
		BoardVO result = boardService.selectNBoardDetail(vo.getUnq());
		
		model.addAttribute("vo", result);
		return MODULE + "/boardModifyWrite";
	}

	@PostMapping("/boardModifySave.do")
	@ResponseBody
	public String boardModifySave(BoardVO vo) throws Exception {
		LOGGER.info("-------------------------------boardModifySave:" +vo);
		int result = 0;
		int count = boardService.selectNBoardPass(vo);
		if (count == 1 ) {
			result = boardService.updateNBoard(vo);
			
			if (result == 1) {
				LOGGER.info("-------------------------------수정 성공");
			} else {
				LOGGER.info("-------------------------------수정 실패");			
			}			
		} else {
			LOGGER.info("-------------------------------비밀번호가 틀립니다.");
			result = -1;
		}
		return result+"";
	}
	
	
	@GetMapping("/passWrite.do")
	public String passWrite(int unq, Model model) throws Exception {
		LOGGER.info("-------------------------------passWrite:" +unq);
		model.addAttribute("unq", unq);
		return MODULE+"/passWrite";
	}
	
	@PostMapping("/boardDelete.do")
	@ResponseBody
	public String boardDelete(BoardVO vo) throws Exception {
		//LOGGER.info("-------------------------------boardDelete vo:" +vo);
		int result = 0;
		int count = boardService.selectNBoardPass(vo);
		
		if (count==1) {
			result = boardService.deleteNBoard(vo);
			if (result == 1) {
				LOGGER.info("-------------------------------삭제 성공");
			} else {
				LOGGER.info("-------------------------------삭제 실패");			
			}
		} else {
			LOGGER.info("-------------------------------비밀번호가 틀립니다.");
			result = -1;
		}
		return result+"";
	}
	
	
}
