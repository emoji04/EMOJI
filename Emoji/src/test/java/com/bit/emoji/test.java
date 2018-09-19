package com.bit.emoji;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.emoji.delicious.service.ExService;

public class test {
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
	public class ExTest {

	   @Inject
	   private ExService dao;
	   // DB연결확인 테스트 : RUN AS JUNIT TEST
	   @Test
	   public void testTime() throws Exception{
	      System.out.println(dao.getTime());
	   }
	   
	   
	}

}
