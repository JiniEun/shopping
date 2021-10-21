package com.study.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

	@Autowired
	@Qualifier("com.study.cart.CartServiceImpl")
	private CartService service;

	@GetMapping("/cartlist")
	public String cartlist(HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/member/login/";
		} else {

			String flag = request.getParameter("contentsno");

			System.out.println("cartlist/flag : " + flag);
			String[] check = request.getParameterValues("content_check");

			List<JoinDTO> list = service.list(id);

			// request에 Model사용 결과 담는다
			request.setAttribute("list", list);

			return "/cartlist";
		}
	}

	@PostMapping("/cartlist")
	public String tocartlist(int contentsno, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");

		String flag = request.getParameter("contentsno");

		System.out.println("cartlist/flag : " + flag);
		System.out.println("cartlist : " + contentsno);

		if (id == null) {
			return "redirect:/member/login/";
		} else {

//			MemberDTO dto = service.mypage(id);
//			model.addAttribute("dto", dto);

			CartDTO dto = new CartDTO();
			dto.setContentsno(contentsno);
			dto.setId(id);

			Map map = new HashMap();
			map.put("id", id);
			map.put("contentsno", contentsno);

			if (service.cnt(map) == 0) {
				int cnt = service.create(dto);
				if (cnt != 1) {
					return "./error";
				}
			}
			String[] check = request.getParameterValues("content_check");

			List<JoinDTO> list = service.list(id);

			// request에 Model사용 결과 담는다
			request.setAttribute("list", list);

			return "/cartlist";

		}
	}
	@RequestMapping("/cart/delete/{contentsno}")
	public String delete(@PathVariable("contentsno") int contentsno) {

		int cnt1 = service.delCart(contentsno);

		CartDTO cart = service.findCart(contentsno);

		int cnt2 = service.delete(cart.getCartno());

		if (cnt2 == 1) {
			return "/cartlist";
		} else {
			return "error";
		}

	}
}
