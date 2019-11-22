package service.impl.join;

import dao.face.join.CounselorJoinDao;
import dao.impl.join.CounselorJoinDaoImpl;
import service.face.join.CounselorJoinService;

public class CounselorJoinServiceImpl implements CounselorJoinService{

	private CounselorJoinDao counselorJoinDao = new CounselorJoinDaoImpl();
	
	@Override
	public int counselorIdCheck(String id) {
		// TODO Auto-generated method stub
		return counselorJoinDao.selectIdForCheck(id);
	}
}
