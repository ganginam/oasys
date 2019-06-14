package com.oasys.common.mail;



import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasys.client.member.service.MemberClientService;
import com.oasys.common.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/common/*")
public class MailController {
	 @Autowired
	  private JavaMailSender mailSender;

	  // mailForm
	  @RequestMapping(value = "/common/mailForm", method=RequestMethod.GET)
	  public String mailForm(String key, Model model) {
		  log.info(key);
		  
		  model.addAttribute("key", key);
		  
		  
		  return "/common/mailForm";
	  }  
	 
	  //mailFormPw
	  @RequestMapping(value="/common/mailFormPw", method=RequestMethod.GET)
	  public String mailFormPw(@SessionAttribute("member") MemberVO member, String key, Model model) {
		  log.info(key);
		  
		  model.addAttribute("key", key);
		  
		  return "/common/mailFormPw";
	  }
	  
	  //pwChange
		@RequestMapping(value="/common/pwChange")
		public String pwChange(@SessionAttribute("member") MemberVO member) {
			return "/common/pwChange";
		}
		
	  // mailSending 코드
	  //인증코드
	  @ResponseBody
	  @RequestMapping(value = "/common/mailSending")
	  public String mailSending(HttpServletRequest request, RedirectAttributes ras) {
		  
		String random = RandomStringUtils.randomAlphanumeric(10);
	    String setfrom = "xzv140@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = "안녕하세요 호텔 오아시스 입니다."; //request.getParameter("title");      // 제목
	    String content = "회원가입 인증 코드 입니다.\n" + random; //request.getParameter("content");    // 내용
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
//	    ras.addFlashAttribute("key", random);
//	    return "redirect:/common/mailForm";
	   return random;
	  }
	  
	  //아이디 찾기
	  @ResponseBody
	  @RequestMapping(value="mail/mailIdSearch")
	  public String mailIdSearch(HttpServletRequest request, RedirectAttributes ras) {
		  String m_id = request.getParameter("m_id");
		  String setfrom = "xzv140@gmail.com";
		  String tomail = request.getParameter("m_email");
		  String title = "안녕하세요 호텔 오아시스 입니다.";
		  String content = "귀하의 아이디는 [ " + m_id + " ] 입니다.";
		  
		  try {
			  MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		     
		      mailSender.send(message);
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		return "/common/searchSuccess";
	  }
}
