package main.service;

import java.util.List;

public interface BoardService {
	// 글저장
	public String insertNBoard(BoardVO vo) throws Exception;
	// 글목록
	public List<?> selectNBoard(BoardVO vo) throws Exception;
	// 글 총갯수
	public int selectNBoardCount(BoardVO vo) throws Exception;
	// 선택된 글 상세
	public BoardVO selectNBoardDetail(int unq) throws Exception;
	// 글 조회수 증가
	public int updateHits(BoardVO vo) throws Exception;
	// 글 수정
	public int updateNBoard(BoardVO vo) throws Exception;
	// 글 삭제	
	public int deleteNBoard(BoardVO vo) throws Exception;
	// 암호확인
	public int selectNBoardPass(BoardVO vo) throws Exception;

}
