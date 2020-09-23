package cn.sise.service;

import cn.sise.pojo.Db;

import java.util.List;

public interface DbService {
    void setDb(Db db);

    List<Db> list();

    void delDb(int id);

    Db get(int id);
}
