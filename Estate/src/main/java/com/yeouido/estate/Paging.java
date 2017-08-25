package com.yeouido.estate;

import java.util.HashMap;
import java.util.Map;

public class Paging {

	public Map<String, Object> pagingMethod(int currentPage, int totalCount, int pagePerRow, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
      // int pageSize = 10; 
        int beginRow = (currentPage-1)*pagePerRow; //�������� ó�� ���� index
        
        //�ѽ���Ŭ�� ������������ȣ     
        int startPage =((currentPage-1)/pageSize)*pageSize+1; 
        //�ѽ���Ŭ�� ��������������ȣ
        int endPage = startPage + pageSize -1;
        //�� ������������ ��������ȣ
        int lastPage = totalCount/pagePerRow;
        if(totalCount%pagePerRow!=0){
            lastPage++;
        }
        if(endPage > lastPage){
            endPage = lastPage;
        }
        
        map.put("beginRow", beginRow);
        map.put("pagePerRow", pagePerRow);
        map.put("startPage", startPage);
        map.put("pageSize", pageSize);
        map.put("endPage", endPage);
        map.put("lastPage", lastPage);
	
		return map;
	}


}
