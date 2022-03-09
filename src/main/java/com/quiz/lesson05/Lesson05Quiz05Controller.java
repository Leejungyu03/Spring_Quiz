package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	// 요청 url : http://localhost/lesson05/quiz05/weather_history
	@RequestMapping("/weather_history")
	public String weatherHistory(Model model) {
		
		// select DB
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("weatherHistoryList", weatherHistoryList);
		
		return "lesson05/weather_history";
	}
	
	@RequestMapping("/add_weather")
	public String addWeatherView() {
		return "lesson05/add_weather";
	}
	
	@PostMapping("add_weather")
	public String addWeather(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather, 
			@RequestParam("temperatures") double temperatures, 
			@RequestParam("precipitation") double precipitation, 
			@RequestParam("microDust") String microDust, 
			@RequestParam("windSpeed") double windSpeed) {
		
		weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		return "redirect:/lesson05/quiz05/weather_history";
	}
}
