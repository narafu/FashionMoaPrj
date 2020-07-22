package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.moa.web.entity.Cloth;

@Mapper
public interface ClothDao {

	@Select("SELECT * FROM ${category} WHERE memberUid = #{uid} ORDER BY regdate DESC LIMIT ${offset}, ${size}")
	public List<Cloth> getClothList(@Param("uid") String uid, @Param("category") String category,
			@Param("offset") int offset, @Param("size") int size);

	@Delete("DELETE FROM ${category} WHERE id = #{id}")
	public void delCloth(@Param("id") String id, @Param("category") String category);

	@Insert("INSERT INTO ${category}(memberUid, img) VALUES(#{uid}, #{img})")
	public void regCloth(@Param("uid") String uid, @Param("category") String category, @Param("img") String img);

}
