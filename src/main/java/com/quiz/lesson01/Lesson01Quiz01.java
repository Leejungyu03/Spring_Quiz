package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01")
@Controller
public class Lesson01Quiz01 {
	@ResponseBody
	@RequestMapping("/1")
	// http://localhost:8080/lesson01/quiz01/1
	public String quiz01_1() {
		String text = "<h1>테스트 프로젝트 완정</h1> <b>해당 프로젝트를 통해서 문제풀이가 진행됩니다.</b>";
		return text;
	}
	
	@ResponseBody
	@RequestMapping("/2")
	public Map<String, Object> quiz01_2() {
		Map<String, Object> map = new HashMap<>();
		map.put("국어", 90);
		map.put("수학", 90);
		map.put("영어", 85);
		return map;
	}
}
