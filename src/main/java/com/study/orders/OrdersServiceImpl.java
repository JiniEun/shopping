package com.study.orders;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.orders.OrdersServiceImpl")
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersMapper mapper;

	@Override
	public int create(OrdersDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public List<OrdersDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

}
