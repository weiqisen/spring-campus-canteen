package cn.sise.service.impl;


import cn.sise.dao.DbMapper;
import cn.sise.pojo.Db;
import cn.sise.service.DbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DbServiceImpl implements DbService {
    @Autowired
    DbMapper dbMapper;

    @Override
    public void setDb(Db db) {
        dbMapper.setDb(db);
    }

    @Override
    public List<Db> list() {
        return dbMapper.list();
    }

    @Override
    public void delDb(int id) {
        dbMapper.delDb(id);
    }

    @Override
    public Db get(int id) {
        return dbMapper.get(id);
    }

}
