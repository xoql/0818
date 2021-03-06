package com.javalec.tea_pjt.controller.member;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.tea_pjt.model.member.dto.MemberDTO;
import com.javalec.tea_pjt.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
		
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);
		
	@Inject
	MemberService mService; //new생성안하고 spring에서 관리해주기 때문에 바로 사용 가능
							//싱글톤(하나의 객체를 만들어 계속 사용)
	
	@RequestMapping(value="signup.do",method=RequestMethod.GET)
	public String signup(){//회원가입페이지 이동
		return "/member/signUp";
	}
	
	@RequestMapping(value="signup.do" ,method=RequestMethod.POST)
	public String signup(MemberDTO member , Model model, HttpServletRequest request) throws ParseException{
		int result = mService.signup(member, request);
		if(result >= 1){
			model.addAttribute("msg","회원가입이 완료. 로그인하세요");
			return "/member/login";
		}else{
			model.addAttribute("msg","회원가입 실패.");
			return "/home";
		}
	}
	
	@RequestMapping("searchId.do")
	public ResponseEntity<String> searchId(String user_id) {
		
		ResponseEntity<String> entity = null;
		
		int result = mService.searchId(user_id);
		if(result>=1) {
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST.OK);
		}else {
			entity = new ResponseEntity<String>("success",HttpStatus.BAD_REQUEST.OK);
		}
		return entity;
	}
	
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login(){//로그인페이지 이동
		return "/member/login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView login(String user_id, String password, HttpSession session, ModelAndView mav){
		MemberDTO dto = mService.login(user_id, password);
		//System.out.println("홍차: "+user_id);
		session.setAttribute("user", dto);//다른 페이지에서 값을 사용할 수 있도록 넘기기
		String user_flag = dto.getUser_flag();
		System.out.println("홍자 씀;;: "+user_flag);
		if(user_flag=="N"||user_flag.equals("N")) {
			mav.addObject("msg", "해당 아이디가 존재하지 않습니다. 회원가입 후 이용해주세요.");
			mav.setViewName("/member/signUp");
			System.out.println("홍차 해당 아이디가 존재하지 않습니다. 회원가입 후 이용해주세요.라고 띄워야하는데..ㅋ 왜 안뜨지");
		}else {
			System.out.println("홍차 엥?");
			if(dto != null){
				mav.addObject("msg", "로그인 성☆공");
				mav.setViewName("/home");
			}else{
				mav.addObject("msg", "로그인 실☆패");
				mav.setViewName("/member/login");
			}
		}
		return mav;
	}
	
	@RequestMapping(value="updateUser.do", method=RequestMethod.GET)
	public String updateUser(){//회원 정보 수정 페이지 이동
		return "/member/updateUser";
	}
	
	@RequestMapping("updateGo.do")
	public String updateGo() {
		return "/member/updateGo";
	}
	
	@RequestMapping("updateGoResult.do")
	public String updateGoResult(HttpServletRequest request, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		String password = dto.getPassword();
		String inputPassword = request.getParameter("inputPassword");
		if(password.equals(inputPassword)) {
			return "/member/updateUser";
		}else {
			return "/member/updateGo";
		}
	}
	
	@RequestMapping(value="updateUser.do", method=RequestMethod.POST)
	public String updateUser(MemberDTO member, HttpServletRequest session){
		int result = mService.updateUser(member);
		if(result >= 1){//회원 정보 수정 성공
			return "/home";
		}else{
			return "/member/updateUser";
		}
	}
	
	/*@RequestMapping("deleteUser.do")
	public String deleteUser(String id, String password){
		int result = mService.deleteUser(id, password);
		if(result >= 1){//회원 삭제 성공
			return "login";
		}else{
			return "/home";
		}
	}*/
	
	@RequestMapping("deleteGo.do")
	public String deleteGo() {
		return "/member/deleteGo";
	}
	
	@RequestMapping("deleteUser.do")
	public ModelAndView deleteUser(HttpSession session, String inputPassword, ModelAndView mav){
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		int result = mService.deleteUser(dto.getUser_id(), inputPassword);
		if(result >= 1){//회원 삭제 성공
			System.out.println("삭제 성공;");
			mav.addObject("msg", "회원 삭제 성공");
			mav.setViewName("/member/login");
		}else{
			System.out.println("삭제 실패;;");
			mav.addObject("msg", "회원 삭제 실패");
			mav.setViewName("/home");
		}
		return mav;
	}
	
	@RequestMapping(value="userInfo.do", method=RequestMethod.GET)
	public String userInfo(){
		return "/member/userInfo";
	}
	
	/*@RequestMapping(value="userInfo.do", method=RequestMethod.POST)
	public String userInfo(String user_id, HttpSession session){
		MemberDTO dto = mService.userInfo(user_id);
		session.setAttribute("user", dto);
		return "/member/userInfo";
	}*/
	
	@RequestMapping("searchPassword.do")
	public String searchPassword(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		String inputPassword = request.getParameter("updateChk");
		System.out.println("user_id: "+user_id);
		System.out.println("updateChk: "+inputPassword);
		String rPassword = mService.searchPassword(user_id);
		if(inputPassword == rPassword) {
			return "/member/updateUser.jsp";
		}else {
			return "/member/userInfo.jsp";
		}
	}
		

}
