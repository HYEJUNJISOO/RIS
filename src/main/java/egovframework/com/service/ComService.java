package egovframework.com.service;

import java.util.List;

import egovframework.com.model.RisBtnDTO;
import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.model.RisPgrmDTO;
import egovframework.com.model.RisUserDTO;

public interface ComService {
	List<RisUserDTO> RisUserList();
	List<RisPgrmDTO> RisPrgmList();
	List<RisBtnDTO> RisBtnList();
	List<RisGrupDTO> RisGrupList();
	List<RisGrmuDTO> RisGrmuList();
}
