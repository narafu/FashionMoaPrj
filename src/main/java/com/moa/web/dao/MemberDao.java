package com.moa.web.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

	@Insert("INSERT INTO TABLE('img') VALUES(#{img}) WHERE ID = #{uid}")
	public Object insertCloth();
	
}
