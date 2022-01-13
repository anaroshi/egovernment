package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

// 커트롤러와 연결되어 잇는 설정
@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public String insertNBoard(BoardVO vo) throws Exception {
		return boardDAO.insertNBoard(vo);
	}

	@Override
	public List<?> selectNBoard(BoardVO vo) throws Exception {		
		return boardDAO.selectNBoard(vo);
	}

	@Override
	public int selectNBoardCount(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardCount(vo);
	}

	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateNBoard(BoardVO vo) throws Exception {
		return boardDAO.updateNBoard(vo);
	}

	@Override
	public int deleteNBoard(BoardVO vo) throws Exception {
		return boardDAO.deleteNBoard(vo);
	}

	@Override
	public int updateHits(BoardVO vo) throws Exception {		
		return boardDAO.updateHits(vo);
	}

	@Override
	public int selectNBoardPass(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardPass(vo);
	}

}
