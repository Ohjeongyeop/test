package org.spring.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.domain.BoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testAllBoard() {
		log.info(boardMapper.selectAll());
	}
	
	@Test
	public void testSelect() {
		// bno가 11인 글 조회
		BoardDTO dto = boardMapper.select(11);
		log.info(dto);
	}
	
	@Test
	public void testUpdate() {
		// bno가 11인 글 수정
		BoardDTO board = new BoardDTO(11,"수정한 제목", "수정한 내용");
		
		boardMapper.update(board);
	}
	
	@Test
	public void testInsert() {
		// bno가 11인 글 수정
		BoardDTO board = new BoardDTO("새로운 제목", "새로운 내용", "뉴비");
		
		boardMapper.insert(board);
	}
	
	@Test
	public void testDelete() {
		int count = boardMapper.delete(16);
		log.info("삭제된 행의 갯수: "+count);
	}
	
	@Test
	public void testInsertBno() {
		BoardDTO board = new BoardDTO("새로운 제목", "새로운 내용", "뉴비");
		boardMapper.insertSelectBno(board);
		log.info("등록된 글 번호: "+board.getBno());
	}
}
