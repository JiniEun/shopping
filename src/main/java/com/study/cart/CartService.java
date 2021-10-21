package com.study.cart;

import java.util.List;
import java.util.Map;

public interface CartService {
	int create(CartDTO dto);

	int delete(int cartno);

	int cnt(Map map);

	List<JoinDTO> list(String id);
}
