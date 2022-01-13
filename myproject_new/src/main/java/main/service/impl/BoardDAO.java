package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public String insertNBoard(BoardVO vo) {		
		return (String) insert("boardDAO.insertNBoard",vo);
	}

	public List<?> selectNBoard(BoardVO vo) {
		return (List<?>) list("boardDAO.selectNBoard",vo);
	}

	public int selectNBoardCount(BoardVO vo) {
		return (int) select("boardDAO.selectNBoardCount",vo);
	}

	public BoardVO selectNBoardDetail(int unq) {		
		return (BoardVO) select("boardDAO.selectNBoardDetail",unq);
	}

	public int deleteNBoard(BoardVO vo) {
		return (int) delete("boardDAO.deleteNBoard", vo);
	}

	public int updateNBoard(BoardVO vo) {
		return (int) update("boardDAO.updateNBoard", vo);
	}

	public int updateHits(BoardVO vo) {
		return (int) update("boardDAO.updateHits", vo);
	}

	public int selectNBoardPass(BoardVO vo) {		
		return (int) select("BoardVO.selectNBoardPass",vo);
	}
}
