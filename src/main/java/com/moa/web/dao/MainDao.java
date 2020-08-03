package com.moa.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.moa.web.entity.FashionLook;
import com.moa.web.view.StyleFeedbackView;

@Mapper
public interface MainDao {

	@Select("SELECT * FROM StyleFeedback ORDER BY regdate DESC LIMIT ${size}")
	public List<StyleFeedbackView> getStyleFeedback(int size);

	@Select("SELECT * FROM FashionLook ORDER BY regdate DESC LIMIT ${size}")
	public List<FashionLook> getFashionLook(int size);

}
