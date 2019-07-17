package org.zerock.controller.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class BoardServiceTest {
	
	@Inject
	private BoardService service;
	
	@Inject
	private BoardDAO dao;
	
	@Test
	public void testCreate()throws Exception{
		BoardVO board = new BoardVO();
		board.setTitle("서비스 새로운글 입력");
		board.setContent("서비스 새로운 글이다!!!!!!!");
		board.setWriter("Service kyle");
		service.regist(board);
		
	}

}
