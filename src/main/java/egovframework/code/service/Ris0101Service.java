package egovframework.code.service;
import java.util.List;
import java.util.Map;

import egovframework.code.model.Ris0101DTO;


public interface Ris0101Service {
	public List<Ris0101DTO> findAll(Map<String, Object> requestMap);

	public int insertRis0101Data(Map<String, Object> requestMap);

	public int codeDuplicateCheck(Map<String, Object> requestMap);
}
