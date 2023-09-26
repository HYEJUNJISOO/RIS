package egovframework.code.service.impl;

import egovframework.code.mapper.Ris0103Mapper;
import egovframework.code.mapper.Ris0109Mapper;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.service.Ris0103Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ris0109Service")
public class Ris0109ServiceImpl implements Ris0103Service{

	@Resource(name="ris0109Mapper")
	private Ris0109Mapper ris0109Mapper;
	
	@Override
	public List<Ris0103DTO> findAll(Map<String, Object> requestMap) {
		return ris0109Mapper.findListAll(requestMap);
	}
	
}
