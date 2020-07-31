package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.moa.web.entity.StyleFeedback;
import com.moa.web.entity.StyleFeedbackView;

@Mapper
public interface StyleFeedbackDao {
	
	@Select("SELECT * FROM StyleFeedback WHERE ${field} LIKE '%${query}%' ORDER BY regdate DESC LIMIT #{size} OFFSET ${offset}")
	List<StyleFeedbackView> getList(@Param("offset")int offset, @Param("size")int size, String query, String field);
	
	@Select("SELECT * FROM StyleFeedback WHERE id = #{id}")
	StyleFeedback get(@Param("id") int id);
	
	@Insert("INSERT INTO StyleFeedback(title, writerId, content, img) VALUES (#{title}, #{writerId}, #{content}, #{img})")
	int insert(String title, @Param("writerId") String writerId, String content, String img);
	
	@Delete("DELETE FROM StyleFeedback WHERE id = ${id}")
	int delete(int id);

	@Update("UPDATE StyleFeedback SET title = #{title}, content = #{content}, img = #{img} WHERE id = ${id}")
	int edit(int id, String title, String content, String img);

	@Select("SELECT COUNT(id) count FROM (SELECT S.* FROM (SELECT *FROM StyleFeedback WHERE ${field} LIKE '%${query}%' ORDER BY regdate DESC) S) S2")
	int getCount(String field, String query);
	
	
}
