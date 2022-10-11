package com.spring.CoffeeBean.resume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.ReqStepVO;
import com.spring.CoffeeBean.command.ResCertVO;
import com.spring.CoffeeBean.command.ResCrrVO;
import com.spring.CoffeeBean.command.ResEduVO;
import com.spring.CoffeeBean.command.ResFileVO;
import com.spring.CoffeeBean.command.ResInfoVO;
import com.spring.CoffeeBean.resume.mapper.IResumeMapper;
import com.spring.CoffeeBean.util.PageVO;

@Service
public class ResumeService implements IResumeService {

	@Autowired
	private IResumeMapper mapper;
	
	
	@Override
	public void registInfo(ResInfoVO vo) {
		mapper.registInfo(vo);

	}

	@Override
	public void registCrr(ResCrrVO vo) {
		mapper.registCrr(vo);

	}

	@Override
	public void registCert(ResCertVO vo) {
		mapper.registCert(vo);

	}

	@Override
	public void registEdu(ResEduVO vo) {
		mapper.registEdu(vo);

	}
	
	@Override
	public void registFile(ResFileVO vo) {
		mapper.registFile(vo);
		
	}


	@Override
	public List<ResInfoVO> getList(String id) {
		
		List<ResInfoVO> list = mapper.getList(id);
		
		return list;
	}
	
	@Override
	public int getTotal(String id) {

		return mapper.getTotal(id);
	}

	
	@Override
	public ResInfoVO getContent(int resNo) {
		
		return mapper.getContent(resNo);
	}

	@Override
	public void update(ResInfoVO vo) {
		mapper.update(vo);

	}

	@Override
	public void delete(int resNo) {
		mapper.delete(resNo);

	}

	@Override
	public void updateInfo(ResInfoVO vo) {
		mapper.updateInfo(vo);
		
	}

	@Override
	public void updateCrr(ResCrrVO vo) {
		mapper.updateCrr(vo);
		
	}

	@Override
	public void updateCert(ResCertVO vo) {
		mapper.updateCert(vo);
		
	}

	@Override
	public void updateEdu(ResEduVO vo) {
		mapper.updateEdu(vo);
		
	}

	@Override
	public void updateFile(ResFileVO vo) {
		mapper.updateFile(vo);
		
	}

	@Override
	public void apply(ReqStepVO vo) {
		mapper.apply(vo);
		
	}

	@Override
	public ResInfoVO ComgetContent(int resNo) {
		
		return mapper.ComgetContent(resNo);
	}

	@Override
	public void reqstepUpdate(ReqStepVO vo) {
		
		mapper.reqstepUpdate(vo);
		
	}

	@Override
	public int avoidDuplication(ReqStepVO vo) {
		
		return mapper.avoidDuplication(vo);
	}

	


}
