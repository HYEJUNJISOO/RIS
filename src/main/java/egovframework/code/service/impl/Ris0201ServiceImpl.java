package egovframework.code.service.impl;

import egovframework.code.mapper.Ris0103Mapper;
import egovframework.code.mapper.Ris0201Mapper;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.service.Ris0103Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ris0201Service")
public class Ris0201ServiceImpl implements Ris0103Service{

	@Resource(name="ris0201Mapper")
	private Ris0201Mapper ris0201Mapper;
	
	@Override
	public List<Ris0103DTO> findAll(Map<String, Object> requestMap) {
		return ris0201Mapper.findListAll(requestMap);
	}
	
}
