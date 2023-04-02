package com.mushan.service;

import com.mushan.common.pojo.generation.GenTable;

public interface GenerationService {

    GenTable selectTableByName(GenTable genTable);
}
