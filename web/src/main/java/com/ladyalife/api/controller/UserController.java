package com.ladyalife.api.controller;


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
