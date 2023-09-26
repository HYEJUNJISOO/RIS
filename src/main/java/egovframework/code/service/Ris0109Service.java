package egovframework.code.service;

import egovframework.code.model.Ris0103DTO;

import java.util.List;
import java.util.Map;


public interface Ris0109Service {
	public List<Ris0103DTO> findAll(Map<String, Object> requestMap);
}
