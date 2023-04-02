package com.mushan.dao.generation;

import com.mushan.common.pojo.generation.GenTable;
import org.apache.ibatis.annotations.Param;

public interface GenerationDao {
    GenTable selectTableByName(@Param("name") String name);
}
