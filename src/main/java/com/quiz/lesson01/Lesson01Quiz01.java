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
		String text = "<h1>�׽�Ʈ ������Ʈ ����</h1> <b>�ش� ������Ʈ�� ���ؼ� ����Ǯ�̰� ����˴ϴ�.</b>";
		return text;
	}
	
	@ResponseBody
	@RequestMapping("/2")
	public Map<String, Object> quiz01_2() {
		Map<String, Object> map = new HashMap<>();
		map.put("����", 90);
		map.put("����", 90);
		map.put("����", 85);
		return map;
	}
}
