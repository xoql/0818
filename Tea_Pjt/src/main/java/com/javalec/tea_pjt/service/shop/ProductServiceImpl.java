package com.javalec.tea_pjt.service.shop;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.tea_pjt.model.shop.dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	ProductDAO productDAO;
}
