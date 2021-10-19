package com.study.contents;
 
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;
 
@Data
public class ContentsDTO {
 
  private int contentsno                  ;
  private int cateno                      ;
  private String pname                    ;
  private int price                       ;
  private String filename                 ;
  private MultipartFile filenameMF        ;
  private String detail                   ;
  private String rdate                    ;
  private int stock                       ;
}