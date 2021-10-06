package com.bytan.controller;

import com.bytan.bean.SignUp;
import com.bytan.service.PageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PageController {

    @Autowired
    PageService pageService;

    /**
     * 获取分页界面数据
     * @param pageFirst
     * @return
     */
    @RequestMapping(value = "/emps")
    @ResponseBody
    public PageInfo getIndex(@RequestParam(value = "pageFirst",defaultValue = "1")Integer pageFirst){
        PageHelper.startPage(pageFirst,5);
        List<SignUp> all = pageService.getAll();
        PageInfo pageAll = new PageInfo(all,5);
        return pageAll;
    }

    /**
     * 保存用户数据
     * @param signUp
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String SaveIeam(SignUp signUp){
        pageService.getSave(signUp);
        String success = "添加成功！";
        return success;
    }

    /**
     * 查询用户最后一条数据
     * @return
     */
    @RequestMapping(value = "/getlast")
    @ResponseBody
    public SignUp SelectLastID(){
        SignUp saveLast = pageService.getSaveLast();
        return saveLast;
    }

    /**
     * 更新用户数据
     * @param signUp
     */
    @RequestMapping(value = "/update/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public void updateIeam(SignUp signUp){
        System.out.println(signUp);
        pageService.updateDate(signUp);
    }

    /**
     * 删除用户数据
     * @param ids
     */
    @RequestMapping(value = "/delete/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteIeam(@PathVariable("ids")String ids){
        System.out.println(ids);
        if (ids.contains(",")){
            List<Integer> ints = new ArrayList<>();
            String[] split = ids.split(",");
            for (String str: split) {
                ints.add(Integer.parseInt(str));
            }
            pageService.deleteAll(ints);
        }else{
            pageService.deleteDate(Integer.parseInt(ids));
        }
    }

    /**
     * 检测用户名是否可用
     * @param username
     * @return
     */
    @RequestMapping("/checkName")
    @ResponseBody
    public boolean checkName(@RequestParam("username") String username){
        System.out.println(username);
        return pageService.seleteName(username);
    }
}
