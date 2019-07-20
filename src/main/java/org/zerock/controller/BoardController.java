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
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	/*REMOVE 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value ="/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, RedirectAttributes rttr)throws Exception{
		logger.info("##############################");
		logger.info("REMOVE - POST");
		logger.info("##############################");
		service.remove(bno);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value ="/removePage", method = RequestMethod.POST)
	public String removePage(@RequestParam("bno")int bno,
			Criteria cri,RedirectAttributes rttr)throws Exception{
		logger.info("##############################");
		logger.info("REMOVE - POST");
		logger.info("##############################");
		service.remove(bno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/board/listPage";
		
	}
	/*REMOVE 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

	/*READ 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno")int bno, Model model)throws Exception{
		logger.info("##############################");
		logger.info("READ - GET");
		logger.info("##############################");
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public String read(@RequestParam("bno")int bno,
			@ModelAttribute("cri")Criteria cri,
			Model model)throws Exception{
		logger.info("##############################");
		logger.info("READPAGE - GET");
		logger.info("##############################");
		model.addAttribute(service.read(bno));
		
		return "/board/read/readPage";
	}
	/*READ 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	
	/*MODIFY 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void modifyGET(int bno , Model model)throws Exception{
		logger.info("##############################");
		logger.info("MODIFY - GET");
		logger.info("##############################");
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value ="/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board,RedirectAttributes rttr)throws Exception{
		
		logger.info("##############################");
		logger.info("MODIFY - POST");
		logger.info("##############################");
		service.modify(board);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value="/modifyPage", method = RequestMethod.GET)
	public String modifyPageGET(@RequestParam("bno")int bno,
			@ModelAttribute("cri")Criteria cri,
			Model model)throws Exception{
		logger.info("##############################");
		logger.info("MODIFYPAGE - GET");
		logger.info("##############################");
		model.addAttribute(service.read(bno));
		
		return "/sboard/modify/modifyPage";
	}
	@RequestMapping(value ="/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(BoardVO board,
			Criteria cri,
			RedirectAttributes rttr)throws Exception{

		logger.info("##############################");
		logger.info("MODIFYPAGE - POST");
		logger.info("##############################");
		
		service.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","success");
				
		return "redirect:/board/listPage";
	}
	/*MODIFY 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	/*REGISTER 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerGET(BoardVO board, Model model)throws Exception{
		logger.info("##############################");
		logger.info("REGISTER - GET");
		logger.info("##############################");
		return "/board/register";
	}
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr)throws Exception{
		logger.info("##############################");
		logger.info("REGISTER - POST");
		logger.info("##############################");
		logger.info(board.toString());
		service.regist(board);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/board/listPage";
	}
	/*REGISTER 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	/*LIST 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public String listAll(Model model)throws Exception{
		logger.info("##############################");
		logger.info("SHOW ALL LIST - GET");
		logger.info("##############################");
		model.addAttribute("list",service.listAll());
		
		return "/board/list/listAll";
	}
	
	@RequestMapping(value="/listCri", method=RequestMethod.GET)
	public String listAll(Criteria cri, Model model)throws Exception{
		logger.info("##############################");
		logger.info("LISTCRI - GET");
		logger.info("##############################");
		
		model.addAttribute("list",service.listCriteria(cri));
		
		return "/board/list/listCri";
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public String listPage(Criteria cri, Model model)throws Exception{
		logger.info("##############################");
		logger.info("LISTPAGE - GET");
		logger.info(cri.toString());
		logger.info("##############################");

		model.addAttribute("list",service.listCriteria(cri));
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.listcountCriteria(cri));
		
		model.addAttribute("pageMaker",pagemaker);
		
		return "/board/list/listPage";
	}
	/*LIST 관련~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
}
















