package com.spring.CoffeeBean.mypage.service;

import java.util.List;

import com.spring.CoffeeBean.command.ReqStepVO;
import com.spring.CoffeeBean.command.StatisticsVO;
import com.spring.CoffeeBean.command.UserVO;


public interface IMypageService {
   
   
   //개인의  진행단계
   List<ReqStepVO> getResStep(String id);
   //기업의 진행단계
   List<ReqStepVO> getRecStep(String id);
   
   //이력서 전체 수
   int getUserAll(String id);
   
   //이력서 전체 수
   int getResAll(String id);
   
   //이력서 전체 수
   int getMsgAll(String id);
   
   //공고 전체 수
   int getRecAll(String id);
   
   //가입대기 전체  수
   int getComAll();
   
   //가입 대기중인 기업 목록 조회
   List<UserVO> waitingJoin();
   
   //idnt_no 1 인 유저들
   List<UserVO> user();
   
   //가입 대기중인 기업 상세보기
   UserVO getComDetail(String id);
   
   //idnt_no 1 유저 보기
   UserVO getUserDetail(String id);
   
   //가입 승인
   void idntNoUpdate(String id);
   

   // 유저 접근 제한
      void useridntNoUpdate(String id);
      
      
     //통계 목록
     List<StatisticsVO> getStatistics(String id);

}