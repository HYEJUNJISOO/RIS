package egovframework.code.service.impl;

import egovframework.code.mapper.Ris0103Mapper;
import egovframework.code.mapper.Ris0109Mapper;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.model.Ris0109DTO;
import egovframework.code.service.Ris0103Service;
import egovframework.code.service.Ris0109Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ris0109Service")
public class Ris0109ServiceImpl implements Ris0109Service {

	@Resource(name="ris0109Mapper")
	private Ris0109Mapper ris0109Mapper;
	
	@Override
	public List<Ris0109DTO> findAll(Map<String, Object> requestMap) {
		return ris0109Mapper.findListAll(requestMap);
	}
	@Override
	public int insertRis0109Data(Map<String, Object> requestMap) { return ris0109Mapper.insertRis0109Data(requestMap); }
	@Override
	public int updateRis0109Data(Map<String, Object> requestMap) {
		return ris0109Mapper.updateRis0109Data(requestMap);
	}
	@Override
	public int deleteRis0109Data(Map<String, Object> requestMap) {
		return ris0109Mapper.deleteRis0109Data(requestMap);
	}
	
}
