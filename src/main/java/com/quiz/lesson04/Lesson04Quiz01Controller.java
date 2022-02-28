package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.sellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

		@Autowired
		private sellerBO sellerBO;
		
	// 요청 URL: http://localhost/lesson04/qu01/1
	@RequestMapping(method = RequestMethod.GET, path = "/1")
	public String addSeller() {
		return "lesson04/add_seller";
	}
	
	// 요청 URL: http://localhost/lesson04/quiz01/add_seller
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("profileImageUrl") String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/after_add_seller";
		
		}
	
	// 문제2
	// 요청 URL: http://localhost/lesson04/quiz01/seller_info
	@GetMapping("/2")
	public String sellerInfo(Model model) {
		Seller newSeller = sellerBO.getLastSeller();
		model.addAttribute("result", newSeller);
		model.addAttribute("subject", "판매자 정보");
		return "lesson04/seller_info";
		
		
	}
}
