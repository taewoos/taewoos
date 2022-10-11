package com.spring.CoffeeBean.user.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.UserVO;
import com.spring.CoffeeBean.user.mapper.IUserMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserMapper mapper;

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public void join(UserVO vo) {
		mapper.join(vo);
	}
	
	@Override
	public void join2(UserVO vo) {
		mapper.join2(vo);
	}
	
	@Override
	public UserVO login(String id, String pw, String idno) {
		UserVO vo = mapper.login(id, pw);
		if(vo==null) {
			return vo;
		} else {
			if(vo.getIdntNo()==7) {
				vo.setUserId(null);
				return vo;
			}else {
				if(vo.getIdntNo()==3) {
					return vo;
				} else {
				vo = mapper.login2(id, pw, idno);
				return vo;
				}
			}
		}
		

	}
	
	@Override
	public UserVO getInfo(String id) {
		return mapper.getInfo(id);
	}

	@Override
	public void updateUser(UserVO vo) {
		mapper.updateUser(vo);
	}
	
	@Override
	public void updateUser2(UserVO vo) {
		mapper.updateUser2(vo);
	}
	
	@Override
	public UserVO userFind(UserVO vo) {
		UserVO fVo = mapper.userFind(vo);
		return fVo;
	}
	@Override
	public UserVO pwFind(UserVO vo) {
		UserVO fVo = mapper.pwFind(vo);
		return fVo;
	}
	@Override
	public void pwUpdate(UserVO vo) {
		mapper.pwUpdate(vo);
	}
	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSEN3ACIDMWBDQP";
		String api_secret = "POCPK7CVDPVMQNOBWDFRDWYF2MAW0VYL";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01030912810");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[커피콩 채용 박람회] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}


}
