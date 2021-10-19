package com.study.notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
	List<NoticeDTO> list(Map map);

	int total(Map map);
	
	NoticeDTO read (int noticeno);
	
	void upCnt(int noticeno);
}
