package egovframework.code.service;
import java.util.List;
import java.util.Map;

import egovframework.code.model.Ris0102DTO;


public interface Ris0102Service {
	public List<Ris0102DTO> findAll(Map<String, Object> requestMap);

	public List<Ris0102DTO> findRis0102List(Map<String, Object> requestMap);

	public Ris0102DTO findRis0102View(Map<String, Object> requestMap);
}
