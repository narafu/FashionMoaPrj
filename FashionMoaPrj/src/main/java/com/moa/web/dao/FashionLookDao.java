package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.moa.web.entity.FashionLook;

@Mapper
public interface FashionLookDao {


	@Select("SELECT * FROM FashionLook LIMIT ${size}")
	List<FashionLook> getList(int size);
	
	@Select("SELECT * FROM FashionLook WHERE id = ${id}")
	FashionLook getDetail(int id);

	@Select("SELECT * FROM FashionLook ORDER BY regdate DESC LIMIT ${size}")
	List<FashionLook> getFashionLookMain(int size);
	


}
