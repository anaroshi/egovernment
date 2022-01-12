package main.service;

import java.util.List;

public interface BoardService {
	
	public String insertNBoard(BoardVO vo) throws Exception;
	
	public List<?> selectNBoard(BoardVO vo) throws Exception;
	
	public int selectNBoardCount(BoardVO vo) throws Exception;

}
