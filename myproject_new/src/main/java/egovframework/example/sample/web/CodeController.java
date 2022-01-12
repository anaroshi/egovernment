package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.EgovSampleExcepHndlr;
import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
@RequestMapping("code")
public class CodeController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	private final String MODULE ="code";
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@GetMapping("/codeWrite.do")
	public String codeWrite() {
		LOGGER.info("-------------------------------codeWrite  ");
		return MODULE+"/codeWrite";
	}
	
	@PostMapping("/codeWriteSave.do")
	public String codeWriteSave(CodeVO vo) throws Exception {
		LOGGER.info("-------------------------------codeWriteSave  vo:"+vo);
		String result = codeService.insertCode(vo);
		if( result==null) {
			LOGGER.info("-------------------------------코드저장 성공");
		} else {
			LOGGER.info("-------------------------------코드저장 실패");
		}
		return "redirect:/code/codeList.do";
	}
	
	@GetMapping("/codeList.do")
	public String codeList(CodeVO vo, Model model) throws Exception {
		List<?> list = codeService.selectCodeList();
		LOGGER.info("-------------------------------codeList : "+list);
		model.addAttribute("count",codeService.selectCodeCount(vo));
		model.addAttribute("resultList", list);
		return MODULE+"/codeList";
	}

	@GetMapping("/codeDetail.do")
	public String codeDetail(int code, Model model) throws Exception {
		LOGGER.info("-------------------------------codeDetail : "+code);
		CodeVO vo = codeService.selectCode(code);
		model.addAttribute("vo",vo);
		return MODULE+"/codeDetail";
	}

	@GetMapping("/codeDelete.do")
	public String codeDelete(int code) throws Exception {
		LOGGER.info("-------------------------------codeDelete : "+code);
		int result = codeService.deleteCode(code);
		if (result==1) {
			LOGGER.info("---------------------------------삭제성공");
		} else {
			LOGGER.info("---------------------------------삭제실패");
		}		
		return "redirect:/code/codeList.do";
	}
	
	@GetMapping("/codeUpdate.do")
	public String updateCode(CodeVO vo, Model model) throws Exception {
		LOGGER.info("-------------------------------updateCode : "+vo);
		int result = codeService.updateCode(vo);		
		if (result==1) {
			LOGGER.info("---------------------------------수정성공");
		} else {
			LOGGER.info("---------------------------------수정실패");
		}
		return "redirect:/code/codeList.do";
	}

}
