package main.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;

@Service("memberSerivce")
public class MemberServiceImpl implements MemberService {

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
}
