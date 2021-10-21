package com.study.orders;

import java.util.List;
import java.util.Map;

public interface OrdersService {
	int create(OrdersDTO dto);
	
	List<OrdersDTO> list(Map map);
}
