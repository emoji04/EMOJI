package com.bit.emoji.service;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.EmailKeyVO;
import com.bit.emoji.model.MemberVO;

@Repository
public class MemberService extends ServiceDao{

    public int insertMember(MemberVO memberVO){
        return sqlSession.insert(MapperName.MEMBER + ".insertMember", memberVO);
    }

    public MemberVO login(String memberEmail){
    	return sqlSession.selectOne(MapperName.MEMBER + ".selectMemberByMemberEmail", memberEmail);
    }
    
    public int insertEmailKey(EmailKeyVO emailKeyVO){
    	return sqlSession.insert(MapperName.MEMBER + ".insertEmailKey", emailKeyVO);
    }
    
    public EmailKeyVO allowedEmail(String memberEmail){
    	return sqlSession.selectOne(MapperName.MEMBER + ".selectMemberByAllowedEmail", memberEmail);
    }

    public int changePassword(MemberVO memberVO){
    	return sqlSession.update(MapperName.MEMBER + ".changePassword", memberVO);
    }

    
}
