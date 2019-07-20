
package org.zerock.BoardDAO.test;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;
import java.sql.Connection;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class BoardDAOTest {
	
	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	//@Test
	public void testCreate()throws Exception{
			BoardVO board = new BoardVO();
			board.setTitle("���ο�� �Է�");
			board.setContent("���ο� ���̴�!!!!!!!");
			board.setWriter("kyle");
			dao.create(board);
		
	}
	
	//@Test
	public void testRead() throws Exception{
		logger.info("####################################");
		logger.info("test:"+dao.read(2).toString());
		logger.info("####################################");
	}
	
	//@Test
	public void testUpdate() throws Exception{
		
		BoardVO board = new BoardVO();
		board.setBno(1);;
		board.setTitle("������ ��!!");
		board.setContent("���� �׽�Ʈ");
		dao.update(board);
	}
	
	//@Test
	public void testDelete()throws Exception{
		dao.delete(1);
	}
	
	//@Test
	public void testListPage()throws Exception{
		int page =1;
		
		List<BoardVO> list = dao.listPage(page);
		
		for(BoardVO boardVo : list){
			logger.info(boardVo.getBno() + ":"+ boardVo.getTitle());
		}
	}

	//@Test
	public void testListCriteria()throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<BoardVO> list = dao.listCriteria(cri);
		
		for(BoardVO boardVO:list) {
			logger.info(boardVO.getBno() + ":"+ boardVO.getTitle());
		}
	}
	
	@Test
	public void testDynamic()throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("글");
		cri.setSearchType("t");
		
		logger.info("######################################");
		
		List<BoardVO> list = dao.listSearch(cri);
		for(BoardVO boardVO : list ) {
			logger.info(boardVO.getBno()+" : "+boardVO.getTitle());
		}
		
		logger.info("######################################");
		logger.info("COUNT: "+dao.listSearchCount(cri));
	}

}






