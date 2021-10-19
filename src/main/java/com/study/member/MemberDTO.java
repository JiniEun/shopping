package com.study.member;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.study.orders.OrdersDTO;

import lombok.Data;

@Data
public class MemberDTO {
	private String id                            ;
	private String passwd                        ;
	private String mname                         ;
	private String tel                           ;
	private String email                         ;
	private String zipcode                       ;
	private String address1                      ;
	private String address2                      ;
	private String job                           ;
	private String mdate                         ;
	private String fname                         ;
	private MultipartFile fnameMF				 ;
	private String grade                         ;
	
	private List<OrdersDTO> list				 ;
}
