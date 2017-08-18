package com.javalec.tea_pjt.service.shop;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.tea_pjt.model.shop.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Inject
	CartDAO cartDAO;

}
