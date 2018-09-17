package com.bit.emoji.member.service;
import javax.servlet.http.HttpSession;

import com.bit.emoji.SHA256;
import com.bit.emoji.model.MemberVO;

public class MemberService {
    private SqlSession sqlSession;
    private SHA256 SHA;

    public int register(MemberVO membervo){
        return 0;
    }

    public boolean login(String mEmail, String mPw){
        return false;
    }

    public void edit(MemberVO membervo, HttpSession session){
    }

}
