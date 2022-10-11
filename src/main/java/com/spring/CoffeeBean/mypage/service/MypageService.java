package com.spring.CoffeeBean.mypage.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.ReqStepVO;
import com.spring.CoffeeBean.command.ResInfoVO;
import com.spring.CoffeeBean.command.StatisticsVO;
import com.spring.CoffeeBean.command.UserVO;
import com.spring.CoffeeBean.mypage.mapper.IMypageMapper;

@Service
public class MypageService implements IMypageService {

   @Autowired
   IMypageMapper mapper;
   
   //지원한 공고,진행단계(개인)
   @Override
   public List<ReqStepVO> getResStep(String id) {
      
      List<ReqStepVO> list = mapper.getResStep(id);
      
      return list;
   }
   
   //지원자 공고, 진행단계 (기업)
   @Override
   public List<ReqStepVO> getRecStep(String id) {
      
      List<ReqStepVO> list = mapper.getRecStep(id);
      
      return list;
   }

   //유저 전체 수
   @Override
   public int getUserAll(String id) {
      
      return mapper.getUserAll(id);
   }
   
   //이력서 전체 수
   @Override
   public int getResAll(String id) {
      
      return mapper.getResAll(id);
   }
   
   // 쪽지  전체 수
   @Override
   public int getMsgAll(String id) {
      
      return mapper.getMsgAll(id);
   }


   //공고 전체 수
   @Override
   public int getRecAll(String id) {
      
      return mapper.getRecAll(id);
   }
   
   //가입 대기 전체 수
   @Override
   public int getComAll() {
      
      return mapper.getComAll();
   }
   
   

   //가입 대기중인 기업
   @Override
   public List<UserVO> waitingJoin() {
      
      List<UserVO> list = mapper.waitingJoin();
      
      return list;
   }

   
   //idnt_no 1 인 유저들

   @Override
   public List<UserVO> user() {
      
      List<UserVO> list = mapper.user();
      
      return list;
   }

   
   
   @Override
   public UserVO getComDetail(String id) {
         
      return mapper.getComDetail(id);
   }
   
   @Override
   public UserVO getUserDetail(String id) {
         
      return mapper.getUserDetail(id);
   }


   @Override
   public void idntNoUpdate(String id) {
      
      mapper.idntNoUpdate(id);
      
   }

   @Override
   public void useridntNoUpdate(String id) {
      
      mapper.useridntNoUpdate(id);
      

   }
   @Override
   public List<StatisticsVO> getStatistics(String id) {
      
      List<StatisticsVO> list = mapper.getStatistics(id);
      
      return list;
   }

}