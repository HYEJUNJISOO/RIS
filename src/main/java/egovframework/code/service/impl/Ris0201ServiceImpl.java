package egovframework.code.service.impl;

import egovframework.code.mapper.Ris0103Mapper;
import egovframework.code.mapper.Ris0201Mapper;
import egovframework.code.model.Ris0101DTO;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.model.Ris0201DTO;
import egovframework.code.service.Ris0103Service;
import egovframework.code.service.Ris0201Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ris0201Service")
public class Ris0201ServiceImpl implements Ris0201Service {

	@Resource(name="ris0201Mapper")
	private Ris0201Mapper ris0201Mapper;
	
	@Override
	public List<Ris0201DTO> findAll(Map<String, Object> requestMap) {
		return ris0201Mapper.findListAll(requestMap);
	}

	@Override
	public List<Ris0201DTO> findRis0201One(Map<String, Object> requestMap) { return ris0201Mapper.findRis0201One(requestMap); }

	/*등록,수정,삭제*/
	@Override
	public int insertRis0201Data(Map<String, Object> requestMap) { return ris0201Mapper.insertRis0201Data(requestMap); }
	@Override
	public int updateRis0201Data(Map<String, Object> requestMap) {
		return ris0201Mapper.updateRis0201Data(requestMap);
	}
	@Override
	public int deleteRis0201Data(Map<String, Object> requestMap) {
		return ris0201Mapper.deleteRis0201Data(requestMap);
	}

}
