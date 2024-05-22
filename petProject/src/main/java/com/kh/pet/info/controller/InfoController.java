package com.kh.pet.info.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.common.template.Pagination;
import com.kh.pet.info.model.service.InfoServiceImpl;
import com.kh.pet.info.model.vo.Info;

@Controller
@RequestMapping("info")
public class InfoController {
	
	@Autowired
	private InfoServiceImpl infoService;

	@GetMapping("/{category}")
	public ModelAndView selectAll(@PathVariable("category") String category,ModelAndView mv) {
		
		switch (category) {
		case "date":
			mv.setViewName("info/dateList");
			break;
		default:
			break;
		}
		return mv;
	}
	
	@RequestMapping("petInfo")
	public String selectPetInfo() {
		return "info/petInfo/petInfoAll";
	}

	@ResponseBody
	@RequestMapping("selectInfoList")
	public List<Info> selectInfoList(String animal, int page){
		
		PageInfo pi = Pagination.getPageInfo(infoService.selectListCount(), page, 10, 10);
		
		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		
		HashMap<String, Object> map = new HashMap();
		map.put("animal", animal);
		map.put("rowBounds", rowBounds);
		
		List<Info> list = infoService.selectInfo(map, rowBounds);
		
		List<Info> infoList = new ArrayList();
		if(list != null) {
				infoList = infoService.selectInfoList(list);
			
			for(Info i : infoList) {
				i.setPageInfo(pi);
			}
		}
		return infoList;
	}
	
	
	
	
	
}
