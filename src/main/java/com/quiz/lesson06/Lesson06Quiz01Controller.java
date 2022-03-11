package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// AJAX의 요청이 왔을 때,
	// - 서버 쪽에서 @ResponseBody 어노테이션을 사용해야 한다.
	// - 리턴되는 값이 반드시 있어야 한다.
	@ResponseBody
	@RequestMapping("/quiz01/add_favorite")
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
	
	// Quiz02 - url 중복 체크
	@ResponseBody
	@RequestMapping("/quiz02/check_duplication_url")
	public Map<String, Boolean> checkDuplicationUrl(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("isDuplication", false);
		
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite != null) {
			result.put("isDuplication", true);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/quiz02/delete_favorite")
	public Map<String, String> deleteFavorite(
			@RequestParam("favorite_id") int id) {
		
		int deletedRow = favoriteBO.deleteFavoriteById(id);
		
		Map<String, String> result = new HashMap<>();
		if (deletedRow > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}