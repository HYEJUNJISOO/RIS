package egovframework.code.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.code.mapper.Ris0102Mapper;
import egovframework.code.model.Ris0102DTO;
import egovframework.code.service.Ris0102Service;

@Service("ris0102Service")
public class Ris0102ServiceImpl implements Ris0102Service{

	@Resource(name="ris0102Mapper")
	private Ris0102Mapper ris0102Mapper;
	
	@Override
	public List<Ris0102DTO> findAll(Map<String, Object> requestMap) {
		return ris0102Mapper.findListAll(requestMap);
	}

	@Override
	public List<Ris0102DTO> findRis0102List(Map<String, Object> requestMap) {
		return ris0102Mapper.findRis0102List(requestMap);
	}
	@Override
	public Ris0102DTO findRis0102View(Map<String, Object> requestMap) {
		return ris0102Mapper.findRis0102View(requestMap);
	}
}
