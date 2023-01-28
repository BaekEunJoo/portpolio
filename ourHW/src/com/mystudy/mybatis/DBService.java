package com.mystudy.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;




// MyBatis 사용해서 작업할 SqlSession을 만들어 줄
//SqlSessionFactory 객체 생성을 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	// static 초기화 구문
	static {
		try {
			
			SqlSessionFactoryBuilder factoryBuilder= new SqlSessionFactoryBuilder();
			Reader reader = Resources.getResourceAsReader("com/mystudy/mybatis/config.xml");
			factory = factoryBuilder.build(reader);
			
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/mystudy/mybatis/config.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
