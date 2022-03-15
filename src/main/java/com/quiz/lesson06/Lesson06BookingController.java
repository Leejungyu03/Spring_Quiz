package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06/booking")
@Controller
public class Lesson06BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// 요청 URL : http://localhost/lesson06/booking/booking_main
	@RequestMapping("/booking_main")
	public String bookingList(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "lesson06/booking_main";
	}
	
	// 예약 삭제하기 - ajax 요청
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		
		Map<String, Object> result = new HashMap<>();
		
		int count = bookingBO.deleteBookingById(id);
		if (count > 0) {
			result.put("result", "success");
			result.put("result_code", 1);
		} else {
			result.put("result", "erroe");
			result.put("result_code", 500);
			result.put("error_message", "삭제가 실패했습니다.");
		}
		
		return result;
	}
	
	
	// 예약 추가하기 - ajax 요청
	@ResponseBody
	@PostMapping("/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Object> result = new HashMap<>();
		
		int count = bookingBO.addNewBooking(name, date, day, headcount, phoneNumber);
		if (count > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("error_message", "예약에 실패하였습니다.");
		}
		return result;
	}
	
	// 예약 내역 체크하기 - ajax 요청
	@ResponseBody
	@PostMapping("/check_booking")
	public Map<String, Object> checkDuplicationName(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("isDuplication", false);
		
		Booking booking = bookingBO.getBookingByName(name, phoneNumber);
		if (booking != null) {
			result.put("isDuplication", true);
			result.put("result", booking);
		}
		
		return result;
	}
}