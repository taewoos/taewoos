package com.spring.CoffeeBean.user.service;

import org.apache.ibatis.annotations.Param;

import com.spring.CoffeeBean.command.UserVO;

public interface IUserService {

	//아이디 중복 확인
	int idCheck(String id);
	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

	//개인 유저 회원 가입
	void join(UserVO vo);
	//기업 유저 회원 가입
	void join2(UserVO vo);

	//로그인
	UserVO login(@Param("id") String id, @Param("pw") String pw, @Param("idno") String idno);
	
	//회원 정보 얻어오기
	UserVO getInfo(String id);
	
	//아이디 찾기 
	UserVO userFind(UserVO vo);
	//비밀번호 찾기
	UserVO pwFind(UserVO vo);
	void pwUpdate(UserVO vo);
	
	//회원 정보 수정
	void updateUser(UserVO vo);
	void updateUser2(UserVO vo);
}
