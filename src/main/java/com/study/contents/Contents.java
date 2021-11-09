package com.study.contents;

import java.io.File;

public class Contents {
	/** 페이지당 출력할 레코드 갯수 */
    public static int RECORD_PER_PAGE = 3;

    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            path = "f:/AIstudy/deploy/shopping/contents/storage/";
            System.out.println("Windows 10: " + path);
            
        } else {
            // System.out.println("Linux");
            path = "/Users/jules/Study/AIstudy/deploy/shopping/contents/storage/";
            //ubuntu
//            path = "/home/ubuntu/deploy/shopping/contents/storage/";
        }
        
        return path;
    }

}
