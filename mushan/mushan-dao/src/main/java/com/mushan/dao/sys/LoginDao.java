package com.mushan.dao.sys;


import com.mushan.common.pojo.sys.LonginUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LoginDao {

    LonginUser queryUserByUserName(@Param("username")String username);


    List<String> getPower(@Param("uid") Long id);


}
