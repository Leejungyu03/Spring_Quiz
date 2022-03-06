package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.RealtorDAO;
import com.quiz.lesson04.model.Realtor;


@Service
public class RealtorBO {
	
	@Autowired
	private RealtorDAO realtorDAO;
	
	
	public void addRealtor(Realtor realtor) {
		realtorDAO.insertRealtor(realtor);
	}
	
	public Realtor getRealtorById(int id) {
		return realtorDAO.selectRealtor(id);
	}

}
