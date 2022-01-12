package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO")
public class CodeDAO extends EgovAbstractDAO {

	public String insertCode(CodeVO vo) {
		return (String) insert("codeDAO.insertCode", vo);
	}

	public List<?> selectCodeList() {
		return (List<?>) list("codeDAO.selectCodeList");
	}

	public int selectCodeCount(CodeVO vo) {
		return (int) select("codeDAO.selectCodeCount", vo);
	}

	public CodeVO selectCode(int code) {
		return (CodeVO) select("codeDAO.selectCode", code);
	}

	public int deleteCode(int code) {
		return (int) delete("codeDAO.deleteCode", code);
	}

	public int updateCode(CodeVO vo) {
		return (int) update("codeDAO.updateCode", vo);
	}
	
}
