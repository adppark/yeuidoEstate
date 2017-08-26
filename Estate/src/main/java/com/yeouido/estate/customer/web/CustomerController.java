package com.yeouido.estate.customer.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeouido.estate.Paging;
import com.yeouido.estate.customer.service.CustomerService;
import com.yeouido.estate.list.web.ListController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	final static int OBJECT_MAIN_CATEGORY_NUM = 6; 
	final static int OBJECT_TAB_CATEGORY_MAX = 4;
	
	@Resource(name="customerService")
	protected CustomerService customerService;
	
	/* 
	 * ���Ǹ����ȸ
	 */
	@RequestMapping(value= "/selectCustomerList.do", method=RequestMethod.POST)
	public ModelAndView selectCustomerList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> custList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			custList = customerService.selectCustomerList(map);
			if (!custList.isEmpty()) {
				// ("").equals(map.get("pagePerRow"))) ? 10 : map.get("pagePerRow").toString() 
						
				int totalCount = Integer.parseInt(custList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("custList",custList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	/*
	 * ���ǵ�� 
	 */
	@RequestMapping(value= "/insertCustomer.do", method=RequestMethod.POST)
	public ModelAndView insertCustomer(@RequestParam Map<String,Object> map)  {  
		
		try {
			//logger.debug("hhihih");
			int result = customerService.insertCustomer(map);
			logger.debug("result : "+  result );
		} catch (Exception e) {
			logger.error("insert error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}

	
	/*
	 * ���� �� ��ȸ
	 */	
	@RequestMapping(value= "/selectCustomerDtl.do", method=RequestMethod.POST)
	public ModelAndView selectCustomerDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = customerService.selectCustomerInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("custInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	/*
	 * ���� ���� ��ȸ
	 */		
	@RequestMapping(value= "/modifyCustomer.do", method=RequestMethod.POST)
	public ModelAndView modifyCustomer(@RequestParam Map<String,Object> map)  {  
		
		try {
			int result = customerService.modifyCustomer(map);
			logger.debug("result : "+  result );
		} catch (Exception e) {
			logger.error("update error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}

	/*
	 * ���� ����
	 */	
	@RequestMapping(value="/deleteCustomer.do",method = RequestMethod.POST)
	public String deleteCustomer(HttpServletRequest request,Model model){
		ListController listView = new ListController();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("custNo", request.getParameter("custNo"));
		
		try {
			int result = customerService.deleteCustomer(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/list/commClList";	
	}
	
	@RequestMapping(value="/viewClient.do",method = RequestMethod.GET)
	public String viewClient(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = customerService.selectCustomerInfo(map);
			model.addAllAttributes(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//ModelAndView mv = new ModelAndView();
		return "/listpage/viewClient";
	
	}
	
	/*
	 * ���� ������������ ���� ���� �� ������������ �̵� 
	 * ���� �ű��Է� = ���� �������� ����
	 */	
	@RequestMapping(value="/modifyCustomerInfo.do",method = RequestMethod.GET)
	public String modifyCustomerInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/listpage/newClient" ;
	
	}
	
	
	
}
