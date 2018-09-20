package com.bit.emoji;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.emoji.service.ExService;

//SpringJUnit4ClassRunner라는 JUnit용 테스트 컨텍스트 프레임워크 확장 클래스 지정 - JUnit이 테스트를 진행하는 중에 테스트가 사용할 애플리케이션 컨텍스트를 만들고 관리하는 작업 진행
@RunWith(SpringJUnit4ClassRunner.class)  

//자동으로 만들어줄 애플리케이션 컨텍스트의 설정파일 위치를 지정
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
	
public class test {
	@Inject
	private ExService exService;
	
	//DB연결 확인 테스트 : RUN AS JUNIT TEST
	@Test
	public void testTime() throws Exception {
		System.out.println(exService.getTime());
	}
}
