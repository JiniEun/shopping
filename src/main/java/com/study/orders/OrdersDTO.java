package com.study.orders;
 
import lombok.Data;
 
@Data
public class OrdersDTO {
  private int   orderno              ;
  private int   cartno               ;
  private int   contentsno           ;
  private String odate               ;
  private int   quantity             ;
  private int   total                ;
  private String payment             ;
  private String id                  ;
  private String mname               ;
  private String pname               ;
  
}