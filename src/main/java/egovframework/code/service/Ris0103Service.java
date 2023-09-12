package egovframework.code.service;
import java.util.List;
import java.util.Map;

import egovframework.code.model.Ris0103DTO;


public interface Ris0103Service {
	public List<Ris0103DTO> findAll(Map<String, Object> requestMap);
}
