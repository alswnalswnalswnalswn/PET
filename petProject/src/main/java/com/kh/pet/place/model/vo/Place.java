package com.kh.pet.place.model.vo;

import lombok.Data;

@Data
public class Place {
	
	private int placeNo;
	
	private String placeName;
	private String placeLat; // 위도
	private String placeLon; // 경도
	private String newAddr; // 도로명주소
	private String oldAddr; // 지번주소
	private String placeTel;
	private String placeDayOff;
	private String placeDayOn;
	private String categoryCode;
}
