package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;
	
	// http://localhost/lesson04/quiz02/1
	@RequestMapping("/1")
	public String quiz02_1() {
		return "/lesson04/add_realtor";
	}
	
	// http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		// db insert
		realtorBO.addRealtor(realtor);
		
		// 추가된 공인중개사를 가져와 Model객체에 담아둠
		realtor = realtorBO.getRealtorById(realtor.getId());
		
		model.addAttribute("result", realtor);
		
		// 추가된 공인중개사 정보를 나타내는 jsp
		return "lesson04/after_add_realtor";
		
	}
}
