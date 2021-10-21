package com.study.cart;

import lombok.Data;

@Data
public class JoinDTO {
	// for join result
	private String id; // member
	private int cartno; // cart
	private int contentsno; //orders.contentsno
	private String pname; // contents.pname
	private String filename; //contents.FILENAME
	private String detail; //contents.DETAIL
	private int price; //contents.DETAIL
}
