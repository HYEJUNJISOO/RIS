package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;

@Mapper("risAppnMapper")
public interface RisAppnMapper {
	
	// 예약 예외 목록
	public List<Ris0213DTO> ris0213FindAll();
	
	// 예약 휴일 목록
	public List<Ris0212DTO> ris0212FindAll();
}
