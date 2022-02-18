package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson01Quiz03ResetController {
	// 요청 URL : http//localhost/lesson01/quiz03/1
	@RequestMapping
	public String quiz01_1() {
		return "lesson01/quiz01/";
	}
}
