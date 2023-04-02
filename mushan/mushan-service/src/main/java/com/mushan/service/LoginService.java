package com.mushan.service;

import com.mushan.common.pojo.sys.LonginUser;

import java.util.Map;

public interface LoginService {


    String login(Map<String, String> map);
}
