package com.ladyalife.api.service;

import com.ladyalife.api.vo.User;
import org.springframework.stereotype.Service;

/**
 * Created by chaipenghui on 2017/9/27.
 */

@Service
public class UserService {
    public User getUserByID(Integer userId) {
        return new User();
    }
}
