package com.bookshop.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.service.BoardService;
import com.bookshop.vo.Ask;
import com.bookshop.vo.AskList;
import com.bookshop.vo.AskReply;

@Controller
@RequestMapping(value = "/ask/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	// [1] 문의게시판 리스트 페이지
	// url 패턴이 'path/ask/'
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String ask(RedirectAttributes ra, HttpSession session, Model model, Ask ask, String book_id, Integer pageNumber) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		// 1) 로그인이 되어있지 않으면 로그인 페이지로 이동시키고 로그인이 필요하다고 알려줌
		if(user_id == null) {
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		if(pageNumber == null) {
			pageNumber = 1;
		}
		// 2) 회원 아이디에 일치하는 문의 목록들을 5개씩 리스트로 가져옴.
			model.addAttribute("list", boardService.getAskList(user_id, pageNumber));
			model.addAttribute("isNext", boardService.getNextPage(user_id, pageNumber));
			model.addAttribute("pageNumber", pageNumber);
			
			return "board/boardList";
		
	}
	
	
	// [2] 문의글 쓰기 페이지
	// url 패턴이 'path/ask/writeAsk'
	@RequestMapping(value = "/writeAsk", method = RequestMethod.GET)
	public String writeAsk(Model model, String book_id, String order_num, RedirectAttributes ra, HttpSession session) throws Exception {
		
		
		String user_id = (String) session.getAttribute("user_id");
		// 1) 로그인이 되어있지 않으면 로그인 페이지로 이동시키고 로그인이 필요하다고 알려줌
		if(user_id == null) {
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		
		// 2) 도서 아이디, 책제목, 작가 / 주문번호를 넘겨줌 
		model.addAttribute("book", boardService.getBookInfo(book_id));
		model.addAttribute("order_num", order_num);	 
		
		
			return "board/boardWrite";	
	}
	
	// 글쓰기 등록
	// url이 'path/ask/writeAction'
	@RequestMapping (value="/wrtieAction", method = RequestMethod.POST)
	public String wrtieAction(Model model, RedirectAttributes ra, HttpSession session, Ask ask) throws Exception {
			String user_id = (String) session.getAttribute("user_id");
			ask.setWriter(user_id);
			
			boardService.writeAction(ask);
		
		return "redirect:/ask/";
	}
	
	// 문의 view
	// url 패턴이 'path/ask/boardView'
	@RequestMapping(value="/boardView", method= RequestMethod.GET)
	public String boardView(Integer ask_id, Ask ask, Model model, HttpSession session, RedirectAttributes ra) throws Exception {
		
		String user_id = (String) session.getAttribute("user_id");
		Ask ask_writer = (Ask) boardService.boardView(ask_id).get("ask");
		
		
		if(!ask_writer.getWriter().equals(user_id) && session.getAttribute("admin") == null) {
			ra.addFlashAttribute("msg", "접근할 수 없는 페이지입니다.");
			return "redirect:/ask/";
		}
		
		// 1) 로그인이 되어있지 않으면 로그인 페이지로 이동시키고 로그인이 필요하다고 알려줌
		if(user_id == null) {
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		
		if(ask_id == null) {
			ra.addFlashAttribute("msg", "잘못된접근입니다.");
			return "redirect:/ask/";
		}
		
		
		HashMap<String, Object> map = boardService.boardView(ask_id);
		
		// 2) 도서 아이디, 책제목, 작가 / 주문번호를 넘겨줌 
		model.addAttribute("book", boardService.getBookInfo(boardService.getBookid(ask_id)));
		model.addAttribute("map", map);
		model.addAttribute("user", boardService.getUserInfo(user_id));
		
		return "board/boardView";
	}
	
	// 댓글 쓰기
	// url 패턴이 'path/ask/insertAskReply'
	@RequestMapping(value="/insertAskReply", method= RequestMethod.GET)
	@ResponseBody
	public List<AskReply> insertAskReply(Ask ask, AskReply askreply, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		Integer admin = (Integer) session.getAttribute("admin");
		// 댓글 작성자에 로그인 되어있는 user_id 값을 넣어줌
		askreply.setWriter(user_id);
		
		List<AskReply> list = boardService.insertAskReply(askreply);
		if(admin != null) {
			boardService.updateAskstatusA(ask);
		}
		if(admin == null) boardService.updateAskstatusU(ask);
		boardService.updateAskreplyCount(askreply.getAsk_id());
		return list;
	}
	
	// 댓글 삭제
	
	
	
	
	

}