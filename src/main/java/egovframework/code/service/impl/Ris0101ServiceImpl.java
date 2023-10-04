package egovframework.code.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import egovframework.code.model.Ris0102DTO;
import egovframework.code.model.Ris0103DTO;
import org.springframework.stereotype.Service;

import egovframework.code.mapper.Ris0101Mapper;
import egovframework.code.model.Ris0101DTO;
import egovframework.code.service.Ris0101Service;

@Service("ris0101Service")
public class Ris0101ServiceImpl implements Ris0101Service{

	@Resource(name="ris0101Mapper")
	private Ris0101Mapper ris0101Mapper;
	
	@Override
	public List<Ris0101DTO> findAll(Map<String, Object> requestMap) {
		return ris0101Mapper.findListAll(requestMap);
	}

	@Override
	public List<Ris0101DTO> findRis0101One(Map<String, Object> requestMap) { return ris0101Mapper.findRis0101One(requestMap); }
	@Override
	public List<Ris0102DTO> findRis0102One(Map<String, Object> requestMap) {
		return ris0101Mapper.findRis0102One(requestMap);
	}
	@Override
	public List<Ris0103DTO> findRis0103One(Map<String, Object> requestMap) { return ris0101Mapper.findRis0103One(requestMap); }
	/*대분류 등록,수정,삭제*/
	@Override
	public int insertRis0101Data(Map<String, Object> requestMap) { return ris0101Mapper.insertRis0101Data(requestMap); }
	@Override
	public int updateRis0101Data(Map<String, Object> requestMap) {
		return ris0101Mapper.updateRis0101Data(requestMap);
	}
	@Override
	public int deleteRis0101Data(Map<String, Object> requestMap) {
		return ris0101Mapper.deleteRis0101Data(requestMap);
	}

	/*중분류 등록,수정,삭제*/
	@Override
	public int insertRis0102Data(Map<String, Object> requestMap) { return ris0101Mapper.insertRis0102Data(requestMap); }
	@Override
	public int updateRis0102Data(Map<String, Object> requestMap) { return ris0101Mapper.updateRis0102Data(requestMap); }
	@Override
	public int deleteRis0102Data(Map<String, Object> requestMap) {
		return ris0101Mapper.deleteRis0102Data(requestMap);
	}

	/*소분류 등록,수정,삭제*/
	@Override
	public int insertRis0103Data(Map<String, Object> requestMap) { return ris0101Mapper.insertRis0103Data(requestMap); }
	@Override
	public int updateRis0103Data(Map<String, Object> requestMap) {
		return ris0101Mapper.updateRis0103Data(requestMap);
	}
	@Override
	public int deleteRis0103Data(Map<String, Object> requestMap) {
		return ris0101Mapper.deleteRis0103Data(requestMap);
	}

	@Override
	public int codeDuplicateCheck(Map<String, Object> requestMap) {
		return ris0101Mapper.codeDuplicateCheck(requestMap);
	}
	
	
}
