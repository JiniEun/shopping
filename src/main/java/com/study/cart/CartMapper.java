package com.study.cart;

import java.util.List;

public interface CartMapper {
	int create(CartDTO dto);

	int delete(int cartno);

	int cnt(String id);

	List<JoinDTO> list(String id);
}
