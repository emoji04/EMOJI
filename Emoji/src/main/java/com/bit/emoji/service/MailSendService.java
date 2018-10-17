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
			String html = 
							"<div style=\"background-color: #F5F6F7; width: 580px\">\n" + 
							"    <div style=\"padding: 20px\"></div>\n" + 
							"		<table width=\"470\"  cellpadding=\"0\"\n" + 
							"			cellspacing=\"0\"\n" + 
							"			style=\"padding-left: 5px; padding-right: 5px; padding-bottom: 10px; background-color: white; border-radius: 10px; margin-left: 50px\">\n" + 
							"			<tbody>\n" + 
							"				<tr>\n" + 
							"					<td\n" + 
							"						style=\"padding-top: 32px; padding-left: 150px;\">\n" + 
							"						<img src=\"https://i.imgur.com/fQDwXO6.png\" width=\"150\"\n" + 
							"						; alt=\"EMOJI\">\n" + 
							"					</td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"				<tr>\n" + 
							"					<td style=\"padding-top: 12px; background-color: white\"><span\n" + 
							"						style=\"padding-top: 16px; padding-bottom: 16px; font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"							<br>\n" + 
							"						\n" + 
							"							 <strong><p\n" + 
							"									style=\"color: black; font-size: 25px; margin-left: 20px;\">" + memberEmail + "님,\n" + 
							"								</p></strong>\n" + 
							"					</span> <span\n" + 
							"						style=\"font-size: 17px; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"							<p style=\"margin-left: 20px\">인증완료 버튼을 클릭하여 회원가입을 완료 해 주세요</p>\n" + 
							"					</span></td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr>\n" + 
							"					<td>\n" + 
							"						<div style=\"background-color: white\">\n" + 
							"							<form action=\"http://localhost:8088/emoji/changePassword \"\n" + 
							"								method=\"post\">\n" + 
							"								 <input type=\"hidden\" name=\"allowedEmail\"\n" + 
							"									value=\""+ memberEmail + "\"> <input type=\"hidden\"\n" + 
							"									name=\"emailKey\" value=\""+ key + "\"> <input type=\"submit\"\n" + 
							"									value=\"인증완료\"\n" + 
							"									style=\"background-color: black; color: white; border: none; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 5px; margin: 20px; margin-top: 30px;\">\n" + 
							"							</form>\n" + 
							"\n" + 
							"\n" + 
							"							<span\n" + 
							"								style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"							</span>\n" + 
							"						</div>\n" + 
							"					</td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr bgcolor=\"white\">\n" + 
							"					<td\n" + 
							"						style=\"padding: 20px; font-size: 12px; line-height: 17px; color: black; font-family: Arial, Helvetica, sans-serif;\">\n" + 
							"						<p style=\"padding-bottom: 10px; color: black;\">This email\n" + 
							"							was generated because of a login attempt from a web or mobile\n" + 
							"							device The login attempt included your correct account name and\n" + 
							"							password.</p>\n" + 
							"						<p style=\"padding-bottom: 10px; color: #c6d4df;\">\n" + 
							"							<span style=\"color: black; font-weight: bold;\">인증 메일 발송\n" + 
							"								기준 한 시간 이내로 회원가입이 이루어 지지 않을 시<br> 다시 이메일 인증을 받으셔야 합니다.\n" + 
							"							</span>\n" + 
							"						</p>\n" + 
							"						<p style=\"padding-bottom: 10px; color: black;\">\n" + 
							"							<span style=\"color: #ffffff; font-weight: bold;\">No one\n" + 
							"								can access your account without also accessing this email.</span>\n" + 
							"						</p>\n" + 
							"						<p style=\"padding-top: 10px; color: black;\">\n" + 
							"							If you are unable to access your account then <a\n" + 
							"								style=\"color: black;\"\n" + 
							"								href=\"https://help.steampowered.com/en/wizard/HelpUnauthorizedLogin?stoken=MbhBCbp3uRMee7KGxhtNs%2BPhne2ZIxF4FGUsK9%2BMs7wHebL5axsAzTKNlM0jF61yyA%2BQBICUiGtvO2vVZu4emg%3D%3D\"\n" + 
							"								rel=\"noreferrer noopener\" target=\"_blank\">use this account\n" + 
							"								specific recovery link</a> for assistance recovering or self-locking\n" + 
							"							your account.\n" + 
							"						</p>\n" + 
							"					</td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"			</tbody>\n" + 
							"		</table>\n" + 
							"    <div style=\"padding: 30px\"></div>\n" + 
							"<div>";
			// 내용 설정
			message.setText(html, "utf-8", "html");

			// 보내는 사람의 메일 설정
			message.setFrom(new InternetAddress("emojiproject@gmail.com"));

			// 받는 사람의 메일 설정
			message.addRecipient(RecipientType.TO, new InternetAddress(email));

			mailSender.send(message);
			
			long time = System.currentTimeMillis(); 
	    	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			String checkDate = dayTime.format(new Date(time));
			
			//임시 이메일 db에 저장 할 객체
			//EmailKeyVO emailKeyVO = new EmailKeyVO(memberEmail,key,checkDate);
			/*emailKeyVO.setEmail(memberEmail);
			emailKeyVO.setKey(key); 
			emailKeyVO.setCheckDate(checkDate);*/
			memberService.insertEmailKey(new EmailKeyVO(memberEmail,key,checkDate));

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}

	};
	
	public void htmlMailSend2(String email) {
		String memberEmail = email; 
		MimeMessage message = mailSender.createMimeMessage();
		String key = new TempKey().getKey(50, false);
		
		try {
			// 제목설정
			message.setSubject("[EMOJI] 비밀번호 변경 안내 ", "utf-8");

			// 내용 구성 ( HTML )
			String html = 
							"<div style=\"background-color: #F5F6F7; width: 580px\">\n" + 
							"    <div style=\"padding: 20px\"></div>\n" + 
							"		<table width=\"470\"  cellpadding=\"0\"\n" + 
							"			cellspacing=\"0\"\n" + 
							"			style=\"padding-left: 5px; padding-right: 5px; padding-bottom: 10px; background-color: white; border-radius: 10px; margin-left: 50px\">\n" + 
							"			<tbody>\n" + 
							"				<tr>\n" + 
							"					<td\n" + 
							"						style=\"padding-top: 32px; padding-left: 150px;\">\n" + 
							"						<img src=\"https://i.imgur.com/fQDwXO6.png\" width=\"150\"\n" + 
							"						; alt=\"EMOJI\">\n" + 
							"					</td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"				<tr>\n" + 
							"					<td style=\"padding-top: 12px; background-color: white\"><span\n" + 
							"						style=\"padding-top: 16px; padding-bottom: 16px; font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"							<br>\n" + 
							"						\n" + 
							"							 <strong><p\n" + 
							"									style=\"color: black; font-size: 25px; margin-left: 20px;\">" + memberEmail + "님,\n" + 
							"								</p></strong>\n" + 
							"					</span> <span\n" + 
							"						style=\"font-size: 17px; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"							<p style=\"margin-left: 20px\">'비밀번호 변경하기' 버튼을 클릭하여 비밀번호를 변경 해 주세요</p>\n" + 
							"					</span></td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr>\n" + 
							"					<td>\n" + 
							"						<div style=\"background-color: white\">\n" + 
							"							<form action=\"http://localhost:8088/emoji/changePassword \"\n" + 
							"								method=\"post\">\n" + 
							"								 <input type=\"hidden\" name=\"allowedEmail\"\n" + 
							"									value=\""+ memberEmail + "\"> <input type=\"hidden\"\n" + 
							"									name=\"emailKey\" value=\""+ key + "\"> <input type=\"submit\"\n" + 
							"									value=\"비밀번호 변경하기\"\n" + 
							"									style=\"background-color: black; color: white; border: none; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 5px; margin: 20px; margin-top: 30px;\">\n" + 
							"							</form>\n" + 
							"\n" + 
							"\n" + 
							"							<span\n" + 
							"								style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\n" + 
							"							</span>\n" + 
							"						</div>\n" + 
							"					</td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"\n" + 
							"				<tr bgcolor=\"white\">\n" + 
							"					<td\n" + 
							"						style=\"padding: 20px; font-size: 12px; line-height: 17px; color: black; font-family: Arial, Helvetica, sans-serif;\">\n" + 
							"						<p style=\"padding-bottom: 10px; color: black;\">This email\n" + 
							"							was generated because of a login attempt from a web or mobile\n" + 
							"							device The login attempt included your correct account name and\n" + 
							"							password.</p>\n" + 
							"						<p style=\"padding-bottom: 10px; color: #c6d4df;\">\n" + 
							"							<span style=\"color: black; font-weight: bold;\">인증 메일 발송\n" + 
							"								기준 1시간 이내로 비밀번호 변경이 이루어 지지 않을 시<br> 다시 이메일 인증을 받으셔야 합니다.\n" + 
							"							</span>\n" + 
							"						</p>\n" + 
							"						<p style=\"padding-bottom: 10px; color: black;\">\n" + 
							"							<span style=\"color: #ffffff; font-weight: bold;\">No one\n" + 
							"								can access your account without also accessing this email.</span>\n" + 
							"						</p>\n" + 
							"						<p style=\"padding-top: 10px; color: black;\">\n" + 
							"							If you are unable to access your account then <a\n" + 
							"								style=\"color: black;\"\n" + 
							"								href=\"https://help.steampowered.com/en/wizard/HelpUnauthorizedLogin?stoken=MbhBCbp3uRMee7KGxhtNs%2BPhne2ZIxF4FGUsK9%2BMs7wHebL5axsAzTKNlM0jF61yyA%2BQBICUiGtvO2vVZu4emg%3D%3D\"\n" + 
							"								rel=\"noreferrer noopener\" target=\"_blank\">use this account\n" + 
							"								specific recovery link</a> for assistance recovering or self-locking\n" + 
							"							your account.\n" + 
							"						</p>\n" + 
							"					</td>\n" + 
							"				</tr>\n" + 
							"\n" + 
							"			</tbody>\n" + 
							"		</table>\n" + 
							"    <div style=\"padding: 30px\"></div>\n" + 
							"<div>";
			// 내용 설정
			message.setText(html, "utf-8", "html");

			// 보내는 사람의 메일 설정
			message.setFrom(new InternetAddress("emojiproject@gmail.com"));

			// 받는 사람의 메일 설정
			message.addRecipient(RecipientType.TO, new InternetAddress(email));

			mailSender.send(message);
			
			long time = System.currentTimeMillis(); 
	    	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			String checkDate = dayTime.format(new Date(time));
			
			//임시 이메일 db에 저장 할 객체
			//EmailKeyVO emailKeyVO = new EmailKeyVO(memberEmail,key,checkDate);
			/*emailKeyVO.setEmail(memberEmail);
			emailKeyVO.setKey(key); 
			emailKeyVO.setCheckDate(checkDate);*/
			memberService.insertEmailKey(new EmailKeyVO(memberEmail,key,checkDate));

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}

	}



}
