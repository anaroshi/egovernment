package main.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import egovframework.example.cmmn.EgovSampleExcepHndlr;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO  extends EgovAbstractDAO {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	public String insertMember(MemberVO vo) {
		LOGGER.info("---------MemberDAO-------------------");
		return (String) insert("memberDAO.insertMember", vo);
	}

	public int selectMemberIdCheck(String userid) {
		return (int) select("memberDAO.selectMemberIdCheck", userid);
	}

	public List<?> seletPostList(String dong) {
		return (List<?>) list("memberDAO.selectPostList", dong);
	}
}
