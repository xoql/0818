package com.javalec.tea_pjt.controller.shop;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.tea_pjt.service.shop.CartService;

@Controller
@RequestMapping("/shop/cart/*")
public class CartController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(CartController.class);
	
	@Inject
	CartService cartService;

}
