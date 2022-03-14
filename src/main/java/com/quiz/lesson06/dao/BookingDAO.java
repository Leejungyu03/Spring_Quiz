package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	
	public List<Booking> selectBookingList();
	
	public int insertNewBooking(
			@Param("name") String name, 
			@Param("date") String date, 
			@Param("day")int day, 
			@Param("headcount") int headcount, 
			@Param("phoneNumber") String phoneNumber);
	
	public int deleteBookingById(int id);
	
	public Booking selectBookingByName(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}
