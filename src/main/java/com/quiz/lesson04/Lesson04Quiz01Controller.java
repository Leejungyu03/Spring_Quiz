package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller	
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// 1번 문제
	@RequestMapping("/1")
	public String quiz01_1() {
		return "lesson04/add_seller";
	}
	
	@RequestMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("profile_url") String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		sellerBO.insertSeller(nickname, profileImageUrl, temperature);
		return "lesson04/after_add_seller";
	}
	
	// 2번 문제
	@RequestMapping("/seller_info")
	public String sellerInfo(
			@RequestParam(value="id", required=false) Integer id,
			Model model) {
		
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLatestSeller();
		} else {
			seller = sellerBO.getSeller(id);
		}
		model.addAttribute("seller", seller);
		return "lesson04/seller_info";
	}
	
}