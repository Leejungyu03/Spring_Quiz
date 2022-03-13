package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO BookingDAO;
	
	public List<Booking> getBookingList() {
		return BookingDAO.selectBookingList();
	}
	
	public int addNewBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return BookingDAO.insertNewBooking(name, date, day, headcount, phoneNumber);
	}
	
	public int deleteBookingById(int id) {
		return BookingDAO.deleteBookingById(id);
	}
}
