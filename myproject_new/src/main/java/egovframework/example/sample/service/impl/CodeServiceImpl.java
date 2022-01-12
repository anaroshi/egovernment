package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.EgovSampleExcepHndlr;
import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("codeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl implements CodeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
	
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;
	
	@Override
	public String insertCode(CodeVO vo) throws Exception {		
		return codeDAO.insertCode(vo);
	}

	@Override
	public List<?> selectCodeList() throws Exception {
		LOGGER.info("-------------------------------impl : selectCodeList  ");
		return codeDAO.selectCodeList();
	}

	@Override
	public int selectCodeCount(CodeVO vo) throws Exception {
		return codeDAO.selectCodeCount(vo);
	}

	@Override
	public CodeVO selectCode(int code) throws Exception {
		return codeDAO.selectCode(code);
	}

	@Override
	public int deleteCode(int code) throws Exception {
		return codeDAO.deleteCode(code);
	}

	@Override
	public int updateCode(CodeVO vo) throws Exception {
		return codeDAO.updateCode(vo);
	}


}
