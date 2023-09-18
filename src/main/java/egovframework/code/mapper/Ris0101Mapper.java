package egovframework.code.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.code.model.Ris0101DTO;

@Mapper("ris0101Mapper")
public interface Ris0101Mapper {
	public List<Ris0101DTO> findListAll(Map<String, Object> requestMap);

	public List<Ris0101DTO> findListOne(Map<String, Object> requestMap);

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
