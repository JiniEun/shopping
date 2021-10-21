package com.study.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.study.contents.ContentsService;

@Controller
public class CartController {
	@Autowired
	@Qualifier("com.study.cart.CartServiceImpl")
	private CartService service;

	@GetMapping("/cartlist")
	public String mypage(HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/member/login/";
		} else {
//	  
//	       MemberDTO dto = service.mypage(id);
//	      
//	       model.addAttribute("dto", dto);

			List<JoinDTO> list = service.list(id);

			// request에 Model사용 결과 담는다
			request.setAttribute("list", list);

			return "/cartlist";
		}
	}
}
