package cn.sise.dao;

import cn.sise.pojo.Db;

import java.util.List;

public interface DbMapper {
    void setDb(Db db);

    List<Db> list();

    void delDb(int id);

    Db get(int id);

}
