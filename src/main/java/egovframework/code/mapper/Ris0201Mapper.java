package egovframework.code.mapper;

import egovframework.code.model.Ris0101DTO;
import egovframework.code.model.Ris0103DTO;
import egovframework.code.model.Ris0201DTO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper("ris0201Mapper")
public interface Ris0201Mapper {
	public List<Ris0201DTO> findListAll(Map<String, Object> requestMap);

	public List<Ris0201DTO> findRis0201One(Map<String, Object> requestMap);

	/*등록,수정,삭제*/
	public int insertRis0201Data(Map<String, Object> requestMap);
	public int updateRis0201Data(Map<String, Object> requestMap);
	public int deleteRis0201Data(Map<String, Object> requestMap);
}
