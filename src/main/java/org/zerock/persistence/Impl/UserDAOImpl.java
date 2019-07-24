package org.zerock.persistence.Impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.persistence.UserDAO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="org.zerock.mapper.userMapper";
	
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login",dto);
	}

}
