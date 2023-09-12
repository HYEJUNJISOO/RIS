package egovframework.code.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.code.mapper.Ris0103Mapper;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.service.Ris0103Service;

@Service("ris0103Service")
public class Ris0103ServiceImpl implements Ris0103Service{

	@Resource(name="ris0103Mapper")
	private Ris0103Mapper ris0103Mapper;
	
	@Override
	public List<Ris0103DTO> findAll(Map<String, Object> requestMap) {
		return ris0103Mapper.findListAll(requestMap);
	}
	
}
