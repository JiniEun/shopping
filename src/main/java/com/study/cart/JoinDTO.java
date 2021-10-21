package com.study.cart;

import lombok.Data;

@Data
public class JoinDTO {
	// for join result
	private String id; // member
	private int cartno; // cart
	private int orderno; // orders.orderno
	private int contentsno; //orders.contentsno
	private int quantity; //orders.quantity
	private String pname; // orders.pname
	private int total; //orders.total
	private String filename; //contents.FILENAME
	private String detail; //contents.DETAIL
}
