package egovframework.example.sample.service;

import java.util.List;

public interface CodeService {

	public String insertCode(CodeVO vo) throws Exception;
	
	public List<?> selectCodeList() throws Exception;
	
	public int selectCodeCount(CodeVO vo) throws Exception;

	public CodeVO selectCode(int code) throws Exception;

	public int deleteCode(int code)throws Exception;

	public int updateCode(CodeVO vo) throws Exception;
}
