package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.moa.web.entity.FreeBoard;
import com.moa.web.view.FreeBoardView;

@Mapper
public interface FreeBoardDao {

	// 게시글 리스트
	@Select("SELECT * FROM FreeBoardView WHERE ${field} LIKE '%${query}%' ORDER BY regdate DESC LIMIT #{size} OFFSET ${offset}")
	List<FreeBoardView> getList(@Param("offset") int offset, @Param("size") int size, String query,
			@Param("field") String field);

	// 게시글 개수
	@Select("SELECT COUNT(*) count FROM FreeBoard")
	int getBoardCount(@Param("field") String field, String query);

	// 게시글 상세
	@Select("SELECT * FROM FreeBoardView WHERE id=#{id}")
	public FreeBoardView detail(int bno);
	
	@Update("UPDATE FreeBoard SET hit=hit+1 WHERE id=#{id}")
	public int hit(int id);
	
	// 게시글 작성
	@Insert("INSERT INTO FreeBoard(title,content,hit,likes,file,email) VALUES(#{title},#{content},#{hit},#{likes},#{file},#{email})")
	public void reg(FreeBoard freeBoard);

	// 게시글 수정
	@Update("UPDATE FreeBoard SET title=#{title}, content=#{content} WHERE id=#{id}")
	public void edit(FreeBoard freeBoard);

	// 게시글 삭제
	@Delete("DELETE FROM FreeBoard WHERE id=#{id}")
	public void delete(FreeBoard freeBoard);

}
