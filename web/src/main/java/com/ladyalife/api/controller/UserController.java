package com.ladyalife.api.controller;


import com.ladyalife.api.service.UserService;
import com.ladyalife.api.vo.User;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


/**
 * Created by chaipenghui on 2017/9/26.
 */

@Api(value = "user")
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    UserService userService;

    @RequestMapping(value = "/getUser")
    @ResponseBody
    @ApiOperation(value = "根据ID获取用户信息", httpMethod = "GET", notes = "get user by id", response = User.class)
    public User getUser(@ApiParam(required = true, value = "用户ID", name = "userId") @RequestParam(value = "userId") Integer userId) {
        return userService.getUserByID(userId);
    }
}
