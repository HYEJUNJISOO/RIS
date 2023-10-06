package egovframework.code.mapper;

import egovframework.code.model.Ris0103DTO;
import egovframework.code.model.Ris0109DTO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper("ris0109Mapper")
public interface Ris0109Mapper {
	public List<Ris0109DTO> findListAll(Map<String, Object> requestMap);

	public int insertRis0109Data(Map<String, Object> requestMap);
	public int updateRis0109Data(Map<String, Object> requestMap);
	public int deleteRis0109Data(Map<String, Object> requestMap);
}
