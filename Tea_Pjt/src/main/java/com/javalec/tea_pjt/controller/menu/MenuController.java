package com.javalec.tea_pjt.controller.menu;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.tea_pjt.controller.member.MemberController;
import com.javalec.tea_pjt.service.member.MemberService;

@Controller
@RequestMapping("/menu/*")
public class MenuController {
	private static final Logger logger
	=LoggerFactory.getLogger(MenuController.class);
	
	@Inject
	MemberService mService;
	
	@RequestMapping("introduceGongcha.do")
	public String IntroduceGongcha() {
		return "menu/introduceGongcha";
	}
}
