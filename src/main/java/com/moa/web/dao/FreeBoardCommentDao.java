package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.moa.web.entity.FreeBoardComment;

@Mapper
public interface FreeBoardCommentDao {
	
	//댓글 작성
	@Insert("INSERT INTO FreeBoardComment (email,content,boardId) VALUES(#{email},#{content},#{bid})")
	public int insertCmt(FreeBoardComment fbdCmt);

	//댓글 수정
	@Update("UPDATE FreeBoardComment SET content=#{content} WHERE cid=#{cid}")
	public void editCmt(FreeBoardComment fbdCmt);
	
	//댓글 삭제
	@Delete("DELETE FROM FreeBoardComment WHERE cid=#{cid}")
	public void deleteCmt(FreeBoardComment fbdCmt);
	
	//댓글 리스트
	@Select("SELECT * FROM FreeBoardComment WHERE boardId=#{boardId}")
	public List<FreeBoardComment> cmtList(int bid);
	
	//댓글 개수
	@Select("SELECT COUNT(*) count FROM FreeBoardComment")
	public int getCmtCount(@Param("field") String field, String query);
}