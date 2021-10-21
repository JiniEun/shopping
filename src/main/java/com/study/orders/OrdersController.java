package com.study.orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.member.MemberDTO;
import com.study.member.MemberService;

@Controller
public class OrdersController {

	@Autowired
	@Qualifier("com.study.orders.OrdersServiceImpl")
	private OrdersService service;

	private MemberService mservice;

	@GetMapping("/orders/create")
	public String create() {

		return "/orders/create";
	}

	@PostMapping("/orders/create")
	public String create(OrdersDTO dto, HttpSession session, HttpServletRequest request, Model model, @RequestParam Map form) {
		String id = (String) session.getAttribute("id");

		Map map = new HashMap();
		map.put("id", id);
		form.forEach((key, value) 
				-> System.out.println("key: " + key + ", value: " + value));

		map.put("contentsno", 1);
//		form.forEach((key, value)-> {
//			System.out.println("key: " + key + ", value: " + value);
//			map.put("contentsno", value);
//		});
				

		System.out.println(id);
		List<OrdersDTO> list = service.list(map);
		dto.setId(id);
		System.out.println(list.get(0).getMname());
		dto.setMname(list.get(0).getMname());
		System.out.println(dto.toString());
		
		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		model.addAttribute("dto", dto);

		return "/orders/create";
	}
}
