package org.zerock.BoardDAO.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.zerock.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})


public class PagingURLtest {
	
	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	//@Test
	public void testURI()throws Exception{
		
		UriComponents uriComponetns = UriComponentsBuilder.newInstance()
				.path("/board/read")
				.queryParam("bno",12) 
				.queryParam("perPageNum", 20)
				.build();
		
		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponetns.toString()); //결과물
		
	}
	
	@Test
	public void testURI2()throws Exception{
		
		UriComponents uriComponetns = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("bno",12) 
				.queryParam("perPageNum", 20)
				.build()
				.expand("board","read")
				.encode();
		
		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponetns.toString()); //결과물
		
	}


}
