package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.sellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class sellerBO {
	
	@Autowired
	private sellerDAO sellerDAO;
	
	public void addSeller(String nickname, String profileImageUrl, double temperature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public Seller getLastSeller () {
		return sellerDAO.selectLastSeller();
	}
}
