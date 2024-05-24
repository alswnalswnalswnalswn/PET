package com.kh.pet.info.controller;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.common.template.Pagination;
import com.kh.pet.info.model.service.InfoServiceImpl;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/info")
@RequiredArgsConstructor
public class InfoRestController {

	private final InfoServiceImpl infoService;
	
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
	
	@GetMapping("selectInfoList")
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
	/*
	
	@GetMapping("infoDetail")
	public ResponseEntity<ResponseData> infoDetail(@PathVariable int boardNo){
		Info info = null;
		ResponseData rd = null;
		try {
		info = infoService.infoDetail(boardNo);
		} catch(Exception e) {
			rd = ResponseData.builder().data(info).message("서버측 문제로 응답불가").responseCode("10").build();
		}
		if(info != null) {
			rd = ResponseData.builder().data(info).message("조회 잘했따~~").responseCode("00").build();
			
		} else {
			rd = ResponseData.builder().data(null).message("내용이 없습니다.").responseCode("05").build();
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		
		return new ResponseEntity<ResponseData>(info, headers, HttpStatus.OK);
	}
		 */
	
}
