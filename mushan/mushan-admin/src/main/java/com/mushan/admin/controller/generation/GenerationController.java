package com.mushan.admin.controller.generation;

import com.mushan.common.pojo.generation.GenTable;
import com.mushan.common.utils.ResponseUtils;
import com.mushan.service.GenerationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/generation")
public class GenerationController {

    @Autowired
    private GenerationService generationService;

    /**
     * 通过表名称添加添加表
     */
    @PostMapping("/table")
    public Object talbe(@RequestBody GenTable genTable){
        //通过表名查询表信息
        GenTable table =  generationService.selectTableByName(genTable);


        return ResponseUtils.ok(table);
    }



}
