package egovframework.code.mapper;

import egovframework.code.model.Ris0103DTO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;
import java.util.Map;

@Mapper("ris0201Mapper")
public interface Ris0201Mapper {
	public List<Ris0103DTO> findListAll(Map<String, Object> requestMap);
}
