package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.sampledoamin.SampleVO;

@RestController
@RequestMapping("/sample")
public class SampleController {
	
	@RequestMapping("/hello")
	public String sayHello(){
		
		return "Hello World";
	}
	
	@RequestMapping("/sendVO") //return json
	public SampleVO sendVO(){
		
		SampleVO vo = new SampleVO();
		vo.setFirstName("길동");
		vo.setLastName("홍");
		vo.setMno(123);
		
		return vo;
	}
	
	@RequestMapping("/sendList") //return list
	public List<SampleVO> sendList(){
		
		List<SampleVO> list = new ArrayList();
		for(int i=0; i<10;i++) {
			SampleVO vo = new SampleVO();
			vo.setFirstName("길동");
			vo.setLastName("홍");
			vo.setMno(i);
			list.add(vo);
		}
		
		return list;
	}
	
	
	@RequestMapping("/sendMap") //return list
	public Map<Integer, SampleVO> sendMap(){
		
		Map<Integer, SampleVO> map = new HashMap();
		for(int i=0; i<10;i++) {
			SampleVO vo = new SampleVO();
			vo.setFirstName("길동");
			vo.setLastName("홍");
			vo.setMno(i);
			map.put(i,vo);
		}
		return map;
	}
	
	@RequestMapping("/sendErrorAuth") //404 error
	public ResponseEntity<Void> sendListAuth(){
		
		ResponseEntity<Void> entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		
		return entity;
	}
	
	
	@RequestMapping("/sendErrorNot") //결과데이터 list와 HTTP상태 코드를 같이 사용해야하는경우
	public ResponseEntity<List<SampleVO>> sendListNot(){
		
		List<SampleVO> list = new ArrayList();
		for(int i=0; i<10;i++) {
			SampleVO vo = new SampleVO();
			vo.setFirstName("길동");
			vo.setLastName("홍");
			vo.setMno(i);
			list.add(vo);
		}
		
		ResponseEntity<List<SampleVO>> entity = new ResponseEntity<>(list,HttpStatus.BAD_REQUEST);
		return entity;
	}
	
	
	
	
	
}
