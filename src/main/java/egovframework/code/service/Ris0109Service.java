package egovframework.code.service;

import egovframework.code.model.Ris0103DTO;
import egovframework.code.model.Ris0109DTO;

import java.util.List;
import java.util.Map;


public interface Ris0109Service {
	public List<Ris0109DTO> findAll(Map<String, Object> requestMap);

	public int insertRis0109Data(Map<String, Object> requestMap);
	public int updateRis0109Data(Map<String, Object> requestMap);
	public int deleteRis0109Data(Map<String, Object> requestMap);
}
