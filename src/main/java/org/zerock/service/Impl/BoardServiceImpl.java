package org.zerock.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;
import org.zerock.service.BoardService;
import org.zerock.util.UploadFileUtilsForBBS;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
		String[] files = board.getFiles();
		
		if(files == null)
			return;
		
		for(String fileName : files) {
			dao.addAttach(fileName);
		}
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) throws Exception {
		dao.updateViewCnt(bno);
		
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void modify(BoardVO board,String uploadPath) throws Exception {
		UploadFileUtilsForBBS util = new UploadFileUtilsForBBS();
		
		dao.update(board);
		Integer bno = board.getBno();
		List<String> fileNameList = dao.getAttach(bno);
		
		if(util.deleteAllFiles(fileNameList,uploadPath)) {
			dao.deleteAttach(bno);
			String[] files = board.getFiles();
			
			if(files == null) {
				return;
			}
			
			for(String fileName : files){
				dao.replaceAttach(fileName, bno);
			}
		}
		
		
		
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteAttach(bno);
		dao.delete(bno);

	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listALL();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listcountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		 return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		
		return dao.getAttach(bno);
	}

}
