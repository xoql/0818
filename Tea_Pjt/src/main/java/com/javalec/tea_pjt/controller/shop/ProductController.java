package com.javalec.tea_pjt.controller.shop;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.tea_pjt.service.shop.ProductService;

@Controller
@RequestMapping("/shop/product/*")
public class ProductController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductService productService;
	
}
