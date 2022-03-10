package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Quiz01Controller {
	@Autowired
	private FavoriteBO favoriteBO;
	
	// 즐겨찾기 추가하기 뷰 화면
	@RequestMapping("/quiz01")
	public String quiz01() {
		return "lesson06/quiz01";
	}
	
	// 즐겨찾기 추가 기능 - AJAX 호출로 들어오는 요청
	@ResponseBody
	@PostMapping("/quiz01/add_favorite")
	public Map<String, String> addFavorite(
			@RequestParam("title") String title,
			@RequestParam("url") String url) {
		
		favoriteBO.addFavorite(title, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	@RequestMapping("/quiz01/favorite_list")
	public String favoriteList(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/favorite_list";
	}
	
	// 주소의 중복 확인 - AJAX를 통해 오는 요청
	@ResponseBody
	@PostMapping("/lesson06/quiz02/check_duplication_url")
	public Map<String, Boolean> checkDuplicationUrl (
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		
		if (favorite == null) {
			result.put("result", false);
		} else {
			result.put("result", true);
		}
		
		result.put("result", true);
		
		return result;
	}
}