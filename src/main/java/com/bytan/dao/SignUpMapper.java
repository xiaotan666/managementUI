package com.bytan.dao;

import com.bytan.bean.SignUp;
import com.bytan.bean.SignUpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SignUpMapper {
    long countByExample(SignUpExample example);

    int deleteByExample(SignUpExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SignUp record);

    int insertSelective(SignUp record);

    List<SignUp> selectByExample(SignUpExample example);

    SignUp selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SignUp record, @Param("example") SignUpExample example);

    int updateByExample(@Param("record") SignUp record, @Param("example") SignUpExample example);

    int updateByPrimaryKeySelective(SignUp record);

    int updateByPrimaryKey(SignUp record);

    SignUp saveLast();
}