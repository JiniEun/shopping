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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.contents.ContentsDTO;

import oracle.net.aso.k;

import oracle.net.aso.v;

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

//			MemberDTO dto = service.mypage(id);
//			model.addAttribute("dto", dto);

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
}
