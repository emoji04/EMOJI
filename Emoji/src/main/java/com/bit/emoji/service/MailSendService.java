package com.bit.emoji.service;


import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.emoji.model.EmailKeyVO;

public class MailSendService {

	@Autowired
	JavaMailSender mailSender;

	@Autowired
    MemberService memberService;

	public void htmlMailSend(String email) {
		String memberEmail = email; 
		MimeMessage message = mailSender.createMimeMessage();
		String key = new TempKey().getKey(50, false);
		
		try {
			// 제목설정
			message.setSubject("[EMOJI] 인증번호 안내 - EMOJI의 가족이 되어 주세요. ", "utf-8");

			// 내용 구성 ( HTML )
			String html = /*"<h1>안녕하세요" + memberEmail + "님</h1> 인증완료 번튼을 클릭하여 회원가입을 완료 해 주세요<br>" + " <br><br>"
							+ "<form action=\"http://localhost:8080/emoji/registerForm \"    method=\"post\" >"
							+ "<input type=\"hidden\" name=\"allowedEmail\" value=\" "+ memberEmail + "\">"
							+ "<input type=\"hidden\" name=\"emailKey\" value=\" "+ key + "\">"
							+ "<input type=\"submit\" value=\"인증완료\" >"
							+ "</form>"
							
							
							+*/ "<table align=\"center\" width=\"470\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-left: 5px; padding-right: 5px; padding-bottom: 10px;\">\n" + 
							"\n" + 
							"				<tbody><tr><td style=\"padding-top: 32px;padding-left: 150px; padding-bottom:32px \">"
							+ "<img src=\"https://i.imgur.com/fQDwXO6.png\""
							+ " width=\"150\"; alt=\"EMOJI\">\n" + 
							"					</td></tr>\n" + 
							"				\n" + 
							"				<tr><td style=\"padding-top: 12px; background-color:#17212e \">\n" + 
							"					<span style=\"padding-top: 16px; padding-bottom: 16px; font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"						<br><hr><br> <strong><p style=\"color:white; font-size:25px;\"> Dear, "+ memberEmail +",\n" + 
							"					</p></strong></span><br>\n" + 
							"					<span  style=\"font-size: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"						<p >인증완료 번튼을 클릭하여 회원가입을 완료 해 주세요</p>\n" + 
							"					</span>\n" + 
							"					</td></tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr><td>\n" + 
							"						<div style=\"background-color:#17212e\">\n" + 
							"<form action=\"http://localhost:8080/emoji/registerForm \"    method=\"post\" >"
							+ "<input type=\"hidden\" name=\"allowedEmail\" value=\""+ memberEmail + "\">"
							+ "<input type=\"hidden\" name=\"emailKey\" value=\""+ key + "\">"
							+ "<input type=\"submit\" value=\"인증완료\" style=\"    background-color: #e7e7e7; color: black;\n" + 
							"    border: none;\n" + 
							"    padding: 15px 32px;\n" + 
							"    text-align: center;\n" + 
							"    text-decoration: none;\n" + 
							"    display: inline-block;\n" + 
							"    font-size: 16px;\n" + 
							"    margin: 4px 2px;\n" + 
							"    cursor: pointer;\" >"
							+ "</form>"
							+
							"							<span style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold; \"></span>\n" +
							"						</div>\n" + 
							"					</td></tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr bgcolor=\"#121a25\"><td style=\"padding: 20px; font-size: 12px; line-height: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif;\">\n" + 
							"							<p style=\"padding-bottom: 10px; color: #c6d4df;\">This email was generated because of a login attempt from a web or mobile device  The login attempt included your correct account name and password.</p>\n" + 
							"							<p style=\"padding-bottom: 10px; color: #c6d4df;\"> <span style=\"color: #ffffff; font-weight: bold;\">인증 메일 발송 기준 한 시간 이내로 회원가입이 이루어 지지 않을 시<br> 다시 이메일 인증을 받으셔야 합니다.</span></p>\n" + 
							"							<p style=\"padding-bottom: 10px; color: #c6d4df;\"><span style=\"color: #ffffff; font-weight: bold;\">No one can access your account without also accessing this email.</span> </p>\n" + 
							"							<p style=\"padding-top: 10px; color: #61696d;\">If you are unable to access your account then <a style=\"color: #8f98a0;\" href=\"https://help.steampowered.com/en/wizard/HelpUnauthorizedLogin?stoken=MbhBCbp3uRMee7KGxhtNs%2BPhne2ZIxF4FGUsK9%2BMs7wHebL5axsAzTKNlM0jF61yyA%2BQBICUiGtvO2vVZu4emg%3D%3D\" rel=\"noreferrer noopener\" target=\"_blank\">use this account specific recovery link</a> for assistance recovering or self-locking your account.</p>\n" + 
							"					</td></tr>\n" + 
							"\n" + 
							"\n" + 
							"				\n" + 
							"\n" + 
							"			</tbody></table>";
			// 내용 설정
			message.setText(html, "utf-8", "html");

			// 보내는 사람의 메일 설정
			message.setFrom(new InternetAddress("nillprogramming@gmail.com"));

			// 받는 사람의 메일 설정
			message.addRecipient(RecipientType.TO, new InternetAddress(email));

			mailSender.send(message);
			
			long time = System.currentTimeMillis(); 
	    	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			String checkDate = dayTime.format(new Date(time));
			
			//임시 이메일 db에 저장 할 객체
			EmailKeyVO emailKeyVO = new EmailKeyVO();
			emailKeyVO.setEmail(memberEmail);
			emailKeyVO.setKey(key); 
			emailKeyVO.setCheckDate(checkDate);
			memberService.insertEmailKey(emailKeyVO);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}

	}



}
