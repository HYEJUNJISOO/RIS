package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RisAppnMapper;
import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RisAppnService;

@Service("risAppnService")
public class RisAppnServiceImpl implements RisAppnService{

	@Resource(name="risAppnMapper")
	private RisAppnMapper risAppnMapper;
	
	// 예약 예외

	@Override
	public List<Ris0213DTO> ris0213FindAll() {
		return risAppnMapper.ris0213FindAll();
	}

	
	// 예약 휴일
	
	@Override
	public List<Ris0212DTO> ris0212FindAll() {
		return risAppnMapper.ris0212FindAll();
	}
	
}
