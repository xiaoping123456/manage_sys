package com.mushan.service.impl.generation;

import com.mushan.common.pojo.generation.GenTable;
import com.mushan.dao.generation.GenerationDao;
import com.mushan.service.GenerationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GenerationServiceImpl implements GenerationService {
    @Autowired
    private GenerationDao generationDao;


    @Override
    public GenTable selectTableByName(GenTable genTable) {
        return generationDao.selectTableByName(genTable.getTableName());
    }
}
