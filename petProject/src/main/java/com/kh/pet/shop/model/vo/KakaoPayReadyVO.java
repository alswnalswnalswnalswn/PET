package com.kh.pet.shop.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@ToString
public class KakaoPayReadyVO {
	private String tid; 
    private String next_redirect_pc_url; 
    private String created_at;
}
