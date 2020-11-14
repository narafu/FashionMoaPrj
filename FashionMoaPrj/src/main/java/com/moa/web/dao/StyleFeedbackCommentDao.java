package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.moa.web.entity.StyleFeedbackComment;

@Mapper
public interface StyleFeedbackCommentDao {

	@Select("SELECT * FROM StyleFeedbackComment WHERE boardId = ${id} ORDER BY regdate DESC")
	List<StyleFeedbackComment> getComment(@Param("id") int id);

	@Insert("INSERT INTO StyleFeedbackComment(writerId, content, boardId) VALUES(#{writerId}, #{content}, ${boardId})")
	int insert(String writerId, String content, int boardId);

	@Delete("DELETE FROM StyleFeedbackComment WHERE id = ${id}")
	int delete(int id);

}
