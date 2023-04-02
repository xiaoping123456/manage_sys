package com.mushan.common.utils;

import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class PageUtils {

    public static void start(){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String num = request.getParameter("pageNum");
        String size = request.getParameter("pageSize");
        PageHelper.startPage(StringUtils.isNotEmpty(num)?Integer.valueOf(num):1, StringUtils.isNotEmpty(size)?Integer.valueOf(size):10);
    }

}
