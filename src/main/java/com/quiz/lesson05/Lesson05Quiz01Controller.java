package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Quiz01Controller {
	// 요청 url: http://localhost/lesson05/quiz01
	@RequestMapping("/quiz01")
	public String quiz01() {
		return "lesson05/quiz01";
	}

}
