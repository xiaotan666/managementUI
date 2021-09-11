package com.bytan.service;

import com.bytan.bean.SignUp;
import com.bytan.bean.SignUpExample;
import com.bytan.dao.SignUpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PageService {

    @Autowired
    SignUpMapper signUpMapper;

    /**
     * 查询所有数据
     * @return
     */
    public List<SignUp> getAll(){
        return signUpMapper.selectByExample(null);
    }

    /**
     * 保存数据
     * @param signUp
     * @return
     */
    public Integer getSave(SignUp signUp){
       return signUpMapper.insertSelective(signUp);
    }

    /**
     * 查询最后一行数据
     * @return
     */
    public SignUp getSaveLast(){
        return signUpMapper.saveLast();
    }

    /**
     * 更新数据
     * @param signUp
     * @return
     */
    public Integer updateDate(SignUp signUp){
        return signUpMapper.updateByPrimaryKeySelective(signUp);
    }

    /**
     * 通过id删除数据
     * @param id
     */
    public void deleteDate(Integer id){
        signUpMapper.deleteByPrimaryKey(id);
    }

    /**
     * 通过id批量删除数据
     * @param id
     */
    public void deleteAll(List<Integer> id){
        SignUpExample signUpExample = new SignUpExample();
        SignUpExample.Criteria criteria = signUpExample.createCriteria();
        criteria.andIdIn(id);
        signUpMapper.deleteByExample(signUpExample);
    }

    /**
     * 查询用户名是否可用
     * @param username
     * @return
     */
    public boolean seleteName(String username){
        SignUpExample signUpExample = new SignUpExample();
        SignUpExample.Criteria criteria = signUpExample.createCriteria();
        SignUpExample.Criteria criteria1 = criteria.andUsernameEqualTo(username);
        long l = signUpMapper.countByExample(signUpExample);
        return l == 0;
    }
}
