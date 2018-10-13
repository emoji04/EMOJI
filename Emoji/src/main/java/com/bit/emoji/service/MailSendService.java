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
							"				<tbody><tr bgcolor=\"#17212e\"><td style=\"padding-top: 32px; \">"
							+ "<img src=\"https://lh3.googleusercontent.com/MlYxHUhMFcVI0QxUHTHgTFCz7ZeseCWcolfKeg9LuJ3tbZoSHrkSD2y5zujA2YoH1zpRrr13xn4wXpxoa-NUWJWIN6Zwi"
							+ "7QGPvGvAR7RFSZszvdrWVGIFbeoOLXMYkTjGctyyMoqPR4_YSs1nX5hau6pvzyA_okD0dq_NeIZ5mXOIk01IeVAREFv_r1YDvVyEXvg5SeYih-UAvMPH2BZ0JhORuTxyzpmQIkayAo"
							+ "hFuLuOUuii2Ea7OrD2b7Q-M3L-VOCtURIiTI_sBTqPsjSykAceuoEy2wrchgR4lqkDeVFHyQU3IdaBL6GeeoynH7YdZd2ikHIOWuXz_1iXeFo7WdAIMMqY1JeD395TEhTQSTy6svybX"
							+ "2epnlL1d-crJ41WuPlmjy0R5sNbsl4lBxRzXFsbx-FX6_UgesFoO3p0uOH6urCx9y_YJHlL1BpO6VrKdb5u5w3VIRTwn0UmONFVqyPnz9mJ5c-51TFQJILhCfUncpzlq4NWaaCISFwH"
							+ "UzUxT6FqJvUhZcuX7hDJAUo92aA3SAAhXEOi6ZXtblrwLYrj2Q77ooacEPEB_mO6E8lWe2PcOgVkaoEenDr1JiyKvZmBrFFCNYT-WXFjNU77BtlHundm82PpQRbBrp_-A=w219-h230-no\""
							+ " width=\"60\" height=\"60\" alt=\"EMOJI\">\n" + 
							"					<span style=\"padding-top: 16px; padding-bottom: 16px; font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"						<br><hr><br> Dear, "+ memberEmail +",\n" + 
							"					</span><br>\n" + 
							"					</td></tr>\n" + 
							"				\n" + 
							"				<tr><td style=\"padding-top: 12px; background-color:#17212e \">\n" + 
							"					<span  style=\"font-size: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"						<p >인증완료 번튼을 클릭하여 회원가입을 완료 해 주세요</p>\n" + 
							"					</span>\n" + 
							"					</td></tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr><td>\n" + 
							"						<div style=\"background-color:#17212e\">\n" + 
							"<form action=\"http://localhost:8088/emoji/registerForm \"    method=\"post\" >"
							+ "<input type=\"hidden\" name=\"allowedEmail\" value=\""+ memberEmail + "\">"
							+ "<input type=\"hidden\" name=\"emailKey\" value=\""+ key + "\">"
							+ "<input type=\"submit\" value=\"인증완료\" >"
							+ "</form>"
							+
							"							<span style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold; \">9RMMP</span>\n" +
							"						</div>\n" + 
							"					</td></tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr bgcolor=\"#121a25\"><td style=\"padding: 20px; font-size: 12px; line-height: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif;\">\n" + 
							"							<p style=\"padding-bottom: 10px; color: #c6d4df;\">This email was generated because of a login attempt from a web or mobile device <a style=\"color: #c6d4df;\" href=\"https://steamcommunity.com/actions/ReportSuspiciousLogin?stoken=aa6c051c5e0024e923902058c65de42c18a9000e55cf30a7d3079a0d0cdaa509002dbd060bf544919aa23bf5820a903d\" rel=\"noreferrer noopener\" target=\"_blank\">located at 46.148.115.20 (UA).</a>  The login attempt included your correct account name and password.</p>\n" + 
							"							<p style=\"padding-bottom: 10px; color: #c6d4df;\">The Steam Guard code is required to complete the login.  <span style=\"color: #ffffff; font-weight: bold;\">No one can access your account without also accessing this email.</span></p>\n" + 
							"							<p style=\"padding-bottom: 10px; color: #c6d4df;\"><span style=\"color: #ffffff; font-weight: bold;\">If you are not attempting to login</span> then please change your Steam password, and consider changing your email password as well to ensure your account security.</p>\n" + 
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
