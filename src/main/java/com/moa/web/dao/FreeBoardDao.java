package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.moa.web.view.FreeBoardView;

@Mapper
public interface FreeBoardDao {

	@Select("SELECT * FROM FreeBoard WHERE ${field} LIKE '%${query}%' ORDER BY regdate DESC LIMIT #{size} OFFSET ${offset}")
	List<FreeBoardView> getList(
			@Param("offset")int offset
			, @Param("size")int size
			, String query
			, @Param("field")String field);


}
