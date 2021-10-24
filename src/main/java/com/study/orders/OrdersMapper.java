package com.study.orders;

import java.util.List;
import java.util.Map;

public interface OrdersMapper {
	int create(OrdersDTO dto);

	List<OrdersDTO> list(Map map);

	List<OrdersDTO> orderCartlist(Map map);
}
