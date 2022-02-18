package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson01Quiz03 {
	// 요청 URL: http://localhost:8000/lesson01/ex02/1
	@RequestMapping("/lesson01/quiz03/1")
	public String ex02_1() {
		//		/WEB-INF/jsp lesson01/quiz03
		return "lesson01/quiz03"; // jsp view
	}
}
