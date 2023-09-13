package egovframework.code.service;
import java.util.List;
import java.util.Map;

import egovframework.code.model.Ris0101DTO;


public interface Ris0101Service {
	public List<Ris0101DTO> findAll(Map<String, Object> requestMap);

	/*대분류 등록,수정,삭제*/
	public int insertRis0101Data(Map<String, Object> requestMap);
	public int updateRis0101Data(Map<String, Object> requestMap);
	public int deleteRis0101Data(Map<String, Object> requestMap);

	/*중분류 등록,수정,삭제*/
	public int insertRis0102Data(Map<String, Object> requestMap);
	public int updateRis0102Data(Map<String, Object> requestMap);
	public int deleteRis0102Data(Map<String, Object> requestMap);

	/*소분류 등록,수정,삭제*/
	public int insertRis0103Data(Map<String, Object> requestMap);
	public int updateRis0103Data(Map<String, Object> requestMap);
	public int deleteRis0103Data(Map<String, Object> requestMap);

	public int codeDuplicateCheck(Map<String, Object> requestMap);
}
