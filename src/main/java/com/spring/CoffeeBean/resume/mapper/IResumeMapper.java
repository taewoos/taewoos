package com.spring.CoffeeBean.resume.mapper;

import java.util.List;

import com.spring.CoffeeBean.command.ReqStepVO;
import com.spring.CoffeeBean.command.ResCertVO;
import com.spring.CoffeeBean.command.ResCrrVO;
import com.spring.CoffeeBean.command.ResEduVO;
import com.spring.CoffeeBean.command.ResFileVO;
import com.spring.CoffeeBean.command.ResInfoVO;
import com.spring.CoffeeBean.util.PageVO;

public interface IResumeMapper {

	//이력서 작성
	void registInfo(ResInfoVO vo);	
	void registCrr(ResCrrVO vo);	
	void registCert(ResCertVO vo);	
	void registEdu(ResEduVO vo);	
	void registFile(ResFileVO vo);
	
	//이력서 수정
	void updateInfo(ResInfoVO vo);
	void updateCrr(ResCrrVO vo);
	void updateCert(ResCertVO vo);
	void updateEdu(ResEduVO vo);
	void updateFile(ResFileVO vo);
	
	//이력서 목록
	List<ResInfoVO> getList(String id);
	
	//총 이력서 수
	int getTotal(String id);
	
	//이력서 상세보기
	ResInfoVO getContent(int resNo);
	
	//이력서 수정
	void update(ResInfoVO vo);
	
	//이력서 삭제
	void delete(int resNo);
	
	//이력서 지원
	void apply(ReqStepVO vo);
	
	//이력서 중복 지원 확인
	int avoidDuplication(ReqStepVO vo);
	
	//이력서 진행단계 불러오기
	ResInfoVO ComgetContent(int resNo);
	
	//이력서 합격 불합격 처리
	void reqstepUpdate(ReqStepVO vo);
}
