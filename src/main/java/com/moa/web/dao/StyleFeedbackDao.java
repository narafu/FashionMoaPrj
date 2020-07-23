package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.moa.web.entity.StyleFeedbackView;

@Mapper
public interface StyleFeedbackDao {
	
	@Select("SELECT * FROM Notice WHERE ${field} LIKE '%${query}%' ORDER BY regdate DESC LIMIT #{size} OFFSET ${offset}")
	List<StyleFeedbackView> getList(@Param("offset")int offset, @Param("size")int size, String query, String field);
}
