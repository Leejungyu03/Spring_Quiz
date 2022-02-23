package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03Quiz03Controller {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// http://localhost/lesson03/quiz03?id=8&type=전세&price=70000
	@RequestMapping("/lesson03/quiz03")
	public String quiz03(
			@RequestParam(value="id") int id,
			@RequestParam(value="type") String type,
			@RequestParam(value="price") int price) {
		int row = realEstateBO.updateReviewById(id, type, price);
		return "변경 완료" + row;
	}
	//http://localhost/lesson03/quiz04/1?id=21
	@RequestMapping("/lesson03/quiz04/1")
	public String quiz04(
			@RequestParam(value="id") int id) {
		int row = realEstateBO.deletetRealestateById(id);
		return "삭제 완료" + row;
	}
	
	
}
