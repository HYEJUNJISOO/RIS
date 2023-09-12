package egovframework.com.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.com.model.RisBtnDTO;
import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.model.RisPgrmDTO;
import egovframework.com.model.RisUserDTO;


@Mapper("ComMapper")
public interface ComMapper {
	List<RisUserDTO> RisUserList();
	List<RisPgrmDTO> RisPrgmList();
	List<RisBtnDTO> RisBtnList();
	List<RisGrupDTO> RisGrupList();
	List<RisGrmuDTO> RisGrmuList();
}