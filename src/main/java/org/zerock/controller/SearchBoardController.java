package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public String listPage(@ModelAttribute("cri")SearchCriteria cri, Model model)
			throws Exception{
		
		logger.info("##############################");
		logger.info("LISTPAGE - GET");
		logger.info(cri.toString());
		logger.info("##############################");

		//model.addAttribute("list",service.listCriteria(cri));
		model.addAttribute("list",service.listSearchCriteria(cri));
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		
		//pagemaker.setTotalCount(service.listcountCriteria(cri));
		pagemaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker",pagemaker);
		
		return "/sboard/list/listPage";
	}
	/*LIST 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	/*READ 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public String read(@RequestParam("bno")int bno,
			@ModelAttribute("cri")SearchCriteria cri,
			Model model)throws Exception{
		logger.info("##############################");
		logger.info("READPAGE - GET");
		logger.info("##############################");
		model.addAttribute(service.read(bno));
		
		return "/sboard/read/readPage";
	}
	/*READ 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	/*MODIFIY 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="/modifyPage", method = RequestMethod.GET)
	public String modifyPageGET(@RequestParam("bno")int bno,
			@ModelAttribute("cri")SearchCriteria cri,
			Model model)throws Exception{
		logger.info("##############################");
		logger.info("MODIFYPAGE - GET");
		logger.info("##############################");
		model.addAttribute(service.read(bno));
		
		return "/sboard/modify/modifyPage";
	}
	@RequestMapping(value ="/modifyAction", method = RequestMethod.POST)
	public String modifyPagePOST(BoardVO board,
			SearchCriteria cri,
			RedirectAttributes rttr)throws Exception{

		logger.info("##############################");
		logger.info("MODIFYPAGE - POST");
		logger.info("##############################");
		
		service.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
				
		return "redirect:/sboard/listPage";
	}
	/*MODIFIY 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	/*REMOVE 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value ="/removeAction", method = RequestMethod.POST)
	public String removePage(@RequestParam("bno")int bno,
			SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		logger.info("##############################");
		logger.info("REMOVE - POST");
		logger.info("##############################");
		service.remove(bno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/sboard/listPage"; //컨트롤러로 가는거임
		
	}
	/*REMOVE 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	/*REGISTER 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerGET(BoardVO board, Model model)throws Exception{
		logger.info("##############################");
		logger.info("REGISTER - GET");
		logger.info("##############################");
		return "/sboard/register";
	}
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr)throws Exception{
		logger.info("##############################");
		logger.info("REGISTER - POST");
		logger.info("##############################");
		logger.info(board.toString());
		service.regist(board);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/sboard/listPage";
	}
	/*REGISTER 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
}




















