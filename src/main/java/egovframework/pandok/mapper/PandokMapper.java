package egovframework.pandok.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris0601DTO;
import egovframework.pandok.model.RisUserDTO;

@Mapper("PandokMapper")
public interface PandokMapper {
	List<Ris0601DTO> getRis0601List();
	List<Ris0102DTO> getRis0102List();
	List<RisUserDTO> getRisUserList();
}