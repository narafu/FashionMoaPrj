package com.moa.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moa.web.dao.MemberDao;

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;

	public Object insertOuter() {

		return memberDao.insertCloth();
		
	}
	
}
