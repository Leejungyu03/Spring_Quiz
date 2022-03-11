package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@ResponseBody
	@PostMapping("/add_booking")
	public String addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		bookingBO.addNewBooking(name, date, day, headcount, phoneNumber);
		return "success";
	}
}
