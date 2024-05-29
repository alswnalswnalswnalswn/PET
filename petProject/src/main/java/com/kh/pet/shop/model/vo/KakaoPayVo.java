package com.kh.pet.shop.model.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class KakaoPayVo {
	private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private String item_name, item_code, payload;
    private Integer quantity, tax_free_amount, vat_amount;
    private LocalDateTime created_at, approved_at;
}
