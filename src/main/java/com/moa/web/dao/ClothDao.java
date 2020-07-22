package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.moa.web.entity.Cloth;

@Mapper
public interface ClothDao {

	@Select("SELECT * FROM ${category} WHERE memberUid = #{uid} ORDER BY regdate DESC LIMIT ${offset}, ${size}")
	public List<Cloth> getOuterList(@Param("category") String category, @Param("uid") String uid,
			@Param("offset") int offset, @Param("size") int size);

}
