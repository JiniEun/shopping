package com.study.cart;

import java.util.List;
import java.util.Map;

public interface CartMapper {
	int create(CartDTO dto);

	int delete(int cartno);

	int cnt(Map map);

	List<JoinDTO> list(String id);
	
	CartDTO findCart(int contentsno);
	
	int delCart(int contentsno);
}
