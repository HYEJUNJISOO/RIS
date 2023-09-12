package egovframework.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.mapper.ComMapper;
import egovframework.com.model.RisBtnDTO;
import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.model.RisPgrmDTO;
import egovframework.com.model.RisUserDTO;
import egovframework.com.service.ComService;


@Service("ComService")
public class ComServiceImpl implements ComService {
	
	@Resource(name = "ComMapper")
	private ComMapper comMapper;
	@Override
	public List<RisUserDTO> RisUserList() {
		// TODO Auto-generated method stub
		return comMapper.RisUserList();
	}
	@Override
	public List<RisPgrmDTO> RisPrgmList() {
		// TODO Auto-generated method stub
		return comMapper.RisPrgmList();
	}
	@Override
	public List<RisBtnDTO> RisBtnList() {
		// TODO Auto-generated method stub
		return comMapper.RisBtnList();
	}
	@Override
	public List<RisGrupDTO> RisGrupList() {
		// TODO Auto-generated method stub
		return comMapper.RisGrupList();
	}
	@Override
	public List<RisGrmuDTO> RisGrmuList() {
		// TODO Auto-generated method stub
		return comMapper.RisGrmuList();
	}
}