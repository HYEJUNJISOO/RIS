package egovframework.code.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.code.model.Ris0102DTO;

@Mapper("ris0102Mapper")
public interface Ris0102Mapper {
	public List<Ris0102DTO> findListAll(Map<String, Object> requestMap);

	public List<Ris0102DTO> findRis0102List(Map<String, Object> requestMap);

	public Ris0102DTO findRis0102View(Map<String, Object> requestMap);
}
