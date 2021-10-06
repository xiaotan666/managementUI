package com.bytan.test;

import com.bytan.bean.SignUp;
import com.bytan.dao.SignUpMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    SignUpMapper signUpMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void test(){
        System.out.println("test");
        System.out.println(signUpMapper);
        List<SignUp> signUps = signUpMapper.selectByExample(null);
        signUps.forEach(System.out::println);
        SignUpMapper mapper = sqlSession.getMapper(SignUpMapper.class);
        System.out.println(mapper);
    }
}
