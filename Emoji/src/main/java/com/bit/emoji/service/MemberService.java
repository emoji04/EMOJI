package com.bit.emoji.service;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.MemberVO;

@Repository
public class MemberService extends ServiceDao{

    public int insertMember(MemberVO memberVO){
        return sqlSession.insert(MapperName.MEMBER + ".insertMember", memberVO);
    }

    public MemberVO login(String memberEmail){
    	return sqlSession.selectOne(MapperName.MEMBER + ".selectMemberByMemberEmail", memberEmail);
    }
    
    

    public void edit(MemberVO membervo, HttpSession session){
    }

}