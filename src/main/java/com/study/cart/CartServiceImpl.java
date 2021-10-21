package com.study.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.cart.CartServiceImpl")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;

	@Override
	public int create(CartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int delete(int cartno) {
		// TODO Auto-generated method stub
		return mapper.delete(cartno);
	}

	@Override
	public int cnt(Map map) {
		// TODO Auto-generated method stub
		return mapper.cnt(map);
	}

	@Override
	public List<JoinDTO> list(String id) {
		// TODO Auto-generated method stub
		return mapper.list(id);
	}

}
