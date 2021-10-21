package com.study.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
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

//			List<DTO> list = service.mainlist(map);

			// request에 Model사용 결과 담는다
//			request.setAttribute("list", list);

			return "/cartlist";
		}
	}
}
