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
import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
@RequestMapping("dept")
public class DeptController {
	
	@Resource(name = "deptService")
	private DeptService deptService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	private final String MODULE ="dept";
	
	@GetMapping("/deptWrite.do")
	public String deptWrite() {
		//LOGGER.info("---------------deptWrite()--");
		return MODULE+"/deptWrite";
	}
	
	@PostMapping("/deptWriteSave.do")
	public String insertDept(DeptVO vo, Model model) throws Exception {
		//LOGGER.info("---------------deptWriteSave()--vo:"+vo);
		String result = deptService.insertDept(vo);
		if (result == null ) {
			LOGGER.info("저장완료");
		} else {
			LOGGER.info("저장실패");
		}
		model.addAttribute("vo",vo);
		return "redirect:/dept/deptList.do";
	}
	
	@GetMapping("/deptList.do")
	public String listDept(DeptVO vo, Model model) throws Exception {
		List<?> list = deptService.selectDeptList(vo);
		//LOGGER.info("----------------list:"+list);
		model.addAttribute("resultList", list);
		return MODULE+"/deptList";
	}

	@GetMapping("/deptDetail.do")
	public String selectDept(String deptno, Model model) throws Exception {
		//LOGGER.info("----------------selectDept:"+deptno);
		DeptVO vo = deptService.selectDetail(deptno);
		model.addAttribute("vo", vo);
		return MODULE+"/deptDetail";
	}
	
	@GetMapping("/deptModifyWrite.do")
	public String selectDeptModify(String deptno, Model model) throws Exception {
		//LOGGER.info("----------------selectDeptModify:"+deptno);
		DeptVO vo = deptService.selectDetail(deptno);
		model.addAttribute("vo", vo);
		return MODULE+"/deptModifyWrite";
	}

	@PostMapping("/deptModify.do")
	public String updateDept(DeptVO vo) throws Exception {
		//LOGGER.info("----------------deptModify:"+vo);
		int result = deptService.updateDept(vo);
		if(result==1) {
			LOGGER.info("---------------수정완료");
		} else {
			LOGGER.info("---------------수정실패");
		}
		return "redirect:/dept/deptDetail.do?deptno="+vo.getDeptno();
	}
	
	@GetMapping("/deptDelete.do")
	public String deleteDept(String deptno) throws Exception {
		//LOGGER.info("----------------deptDelete:"+deptno);
		int result = deptService.deleteDept(deptno);
		//LOGGER.info("---------------Delete-result:"+result);
		if (result == 1) {
			LOGGER.info("---------------삭제완료");
		} else {
			LOGGER.info("---------------삭제실패");
		}
		return "redirect:/dept/deptList.do";
	}
}
