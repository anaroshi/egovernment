package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.EgovSampleExcepHndlr;
import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		LOGGER.info("---------Impl-------------------memberWriteSave vo: "+vo);
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		return memberDAO.selectMemberIdCheck(userid);
	}

	@Override
	public List<?> selectPostList(String dong) throws Exception {
		return memberDAO.seletPostList(dong);
	}

	@Override
	public int selectMemberCount(MemberVO vo) throws Exception {
		return memberDAO.selectMemberCount(vo);
	}
	
}
