package egovframework.pandok.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pandok.mapper.PandokMapper;
import egovframework.pandok.service.PandokService;
import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris0601DTO;
import egovframework.pandok.model.RisUserDTO;

@Service("PandokService")
public class PandokServiceImpl implements PandokService {
	@Resource(name="PandokMapper")
	private PandokMapper pandokMapper;
	
	@Override
	public List<Ris0601DTO> getRis0601List() {
		return pandokMapper.getRis0601List();
	}

	@Override
	public List<Ris0102DTO> getRis0102List() {
		return pandokMapper.getRis0102List();
	}

	@Override
	public List<RisUserDTO> getRisUserList() {
		return pandokMapper.getRisUserList();
	}
}