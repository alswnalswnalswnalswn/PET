package com.kh.pet.info.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pet.info.model.service.InfoServiceImpl;

@Controller
@RequestMapping("info")
public class InfoController {
	
	@Autowired
	private InfoServiceImpl infoService;
/*
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
	*/
	@RequestMapping("petInfo")
	public String selectPetInfo() {
		return "info/petInfo/petInfoAll";
	}
/*
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
		
		List<Integer> boardNoList = infoService.selectBoardNoList(map);

		// Info 리스트 초기화
		List<Info> infoList = new ArrayList<>();
		if (boardNoList != null && !boardNoList.isEmpty()) {
		    // 각 boardNo에 대해 Info 객체를 생성
		    for (Integer boardNo : boardNoList) {
		        Info info = infoService.selectInfoByBoardNo(boardNo);
		        // 각 Info 객체에 해당하는 attNo 리스트를 가져와서 설정
		        List<Attachment> attNoList = infoService.selectAttNoListByBoardNo(boardNo);
		        info.setAttachmentList(attNoList);
		        // PageInfo 설정
		        info.setPageInfo(pi);
		        
		        // 최종 리스트에 추가
		        infoList.add(info);
		    }
		}
		for(Info i : infoList) {
			i.setPageInfo(pi);
		}
		return infoList;
	}
	
	*/
	
	
	
}
