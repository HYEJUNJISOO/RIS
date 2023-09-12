package egovframework.code.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.code.model.Ris0103DTO;

@Mapper("ris0103Mapper")
public interface Ris0103Mapper {
	public List<Ris0103DTO> findListAll(Map<String, Object> requestMap);
}
