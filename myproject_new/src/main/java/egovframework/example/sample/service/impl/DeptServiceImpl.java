package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("deptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleServiceImpl.class);
	
	@Resource(name="deptDAO")
	private DeptDAO deptDAO;
	
	@Override
	public String insertDept(DeptVO vo) throws Exception {
		LOGGER.info("--DeptServiceImpl-----insertDept(DeptVO vo) ");
		return deptDAO.insertDept(vo);
	}

	@Override
	public List<?> selectDeptList(DeptVO vo) throws Exception {
		return deptDAO.selectDeptList(vo);
	}

	@Override
	public DeptVO selectDetail(String deptno) throws Exception {
		return deptDAO.selectDetail(deptno);
	}

	@Override
	public int deleteDept(String deptno) throws Exception {
		return deptDAO.deleteDept(deptno);
	}

	@Override
	public int updateDept(DeptVO vo) throws Exception {		
		return deptDAO.updateDept(vo);
	}

}
