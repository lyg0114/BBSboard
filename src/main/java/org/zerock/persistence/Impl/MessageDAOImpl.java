package org.zerock.persistence.Impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MessageVO;
import org.zerock.persistence.MessageDAO;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession session;
	private static String namespace ="org.zerock.mapper.MessageMapper";
	
	@Override
	public void create(MessageVO vo) throws Exception {
		session.insert(namespace+".create",vo);

	}

	@Override
	public MessageVO readMessage(Integer mid) throws Exception {
		
		return session.selectOne(namespace+".create",mid);
	}

	@Override
	public void updateState(Integer mid) throws Exception {
		session.update(namespace+".create",mid);

	}

}
