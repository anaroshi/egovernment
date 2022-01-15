package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.EgovSampleExcepHndlr;
import main.service.MemberService;
import main.service.MemberVO;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	private final String MODULE = "member";
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	/*  
	 * 회원등록화면
	 */
	@GetMapping("/memberWrite.do")
	public String memberWrite() {
		LOGGER.info("-------------------------------memberWrite  ");
		return MODULE+"/memberWrite";
	}
	
	/*  
	 * 회원정보DB저장
	 */
	@PostMapping("/memberWriteSave.do")	
	@ResponseBody
	public String memberWriteSave(MemberVO vo) throws Exception {
		LOGGER.info("-------------------------------memberWriteSave vo: "+vo);
		
		String msg = "";
		// 생년월일 형식 지우기 java String -> Oracle date
		String birth = vo.getBirth();		
		birth = birth.replace("-", "");
		birth = birth.replace("/", "");
		birth = birth.replace(".", "");
		vo.setBirth(birth);
		
		String result = memberService.insertMember(vo);
		LOGGER.info("-------------------------------memberWriteSave result: "+result);
		if(result==null) {
			msg = "ok";   // null값이 오면 저장됨.
		} else {
			msg = "fail";
		}
		LOGGER.info("-------------------------------memberWriteSave msg: "+msg);
		return msg;
	}
	
	/*  
	 * 아이디 중복 체크
	 */
	@ResponseBody
	@PostMapping("/idcheck.do")
	public String idcheck(String userid) throws Exception {
		String msg = "ok";
		LOGGER.info("-------------------------------selectIdCheck ");
		int result = memberService.selectMemberIdCheck(userid);
		LOGGER.info("-------------------------------selectIdCheck result:"+result);
		if(result==1) {
			msg = "fail";
			LOGGER.info("-------------------------------userid exist!!");
		}
		return msg;
	}
	
	/*  
	 * 우편번호 주소 찾기 화면
	 */
	@GetMapping("/post1.do")
	public String post1() {
		LOGGER.info("-------------------------------post1 ");
		return MODULE+"/post1";
	}
	
	/*  
	 * 우편번호 주소 검색
	 */	
	@PostMapping("/post2.do")
	public String post2(String dong, Model model) throws Exception {
		LOGGER.info("-------------------------------post2 ");
		List<?> list = memberService.selectPostList(dong);
		model.addAttribute("resultList", list);
		return MODULE+"/post2";
	}
	
	/*  
	 * 로그인
	 */
	@GetMapping("/loginWrite.do")
	public String loginWrite() {
		LOGGER.info("-------------------------------loginWrite ");
		return MODULE+"/loginWrite";
	}
	
	/*  
	 * 로그인 처리
	 */
	@PostMapping("/loginWriteSub.do")
	@ResponseBody
	public String loginProcessing(MemberVO vo, HttpSession session) throws Exception{
		String msg = "fail";
		LOGGER.info("-------------------------------loginWriteSub ");
		int result = memberService.selectMemberCount(vo);
		LOGGER.info("-------------------------------loginWriteSub result: "+result);
		if(result==1) {
			msg="ok";
			LOGGER.info("-------------------------------login 성공 ");
			
			// ------------------- 세션생성 -------------------
			session.setAttribute("sessionUserID", vo.getUserid());
		}
		LOGGER.info("-------------------------------login msg "+msg);
		return msg;
	}
	
	/*  
	 * 로그아웃 처리
	 */
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		// 세션 삭제
		session.removeAttribute("sessionUserID");		
		return MODULE+"/loginWrite";
	}

	/*  
	 * 회원정보 상세
	 */
	@GetMapping("/memberDetail.do")
	public String memberDetail(String userid, Model model) throws Exception {
		MemberVO detailVo = memberService.selectMemberDetail(userid);
		model.addAttribute("vo", detailVo);
		return MODULE+"/memberDetail";
	}
	
	/*
	 * 회원정보 수정화면
	 */
	@GetMapping("/memberModify.do")
	public String memberModify(String userid, Model model) throws Exception {
		LOGGER.info("-------------------------------memberModify");
		MemberVO detailVo = memberService.selectMemberDetail(userid);
		model.addAttribute("vo", detailVo);
		return MODULE+"/memberModify";
	}
	 
	 /*
	  * 회원정보 수정 처리
	  */
	 @ResponseBody
	 @PostMapping("/memberModifySave.do")
	 public String memberModifySave(MemberVO vo, Model model) throws Exception {
		 
		// 생년월일 형식 지우기 java String -> Oracle date
		String birth = vo.getBirth();		
		birth = birth.replace("-", "");
		birth = birth.replace("/", "");
		birth = birth.replace(".", "");
		vo.setBirth(birth);
		
		int result = memberService.updateMember(vo);
		if(result==1) {
			LOGGER.info("-------------------------------updateMember 성공 ");
		} else {
			LOGGER.info("-------------------------------updateMember 실패 ");			 
		}
		return result+"";
	 }
	 
	 /*
	  * 암호 변경화면
	  */
	@GetMapping("/pass1.do")
	public String passModify(String userid, Model model) throws Exception {
		model.addAttribute("userid", userid);
		return MODULE+"/pass1";
	}
	
	/*
	  * 암호 변경화면 처리
	  */
	@PostMapping("/pass2.do")
	@ResponseBody
	public String passModifySave(MemberVO vo) throws Exception {
		LOGGER.info("-------------------------------passModifySave : "+vo);
		int result = memberService.updatePass(vo); 
		LOGGER.info("-------------------------------passModifySave result : "+result);
		return result+"";
	}
}
