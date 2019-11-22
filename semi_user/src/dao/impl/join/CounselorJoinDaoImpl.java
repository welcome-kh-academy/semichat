package dao.impl.join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.face.join.CounselorJoinDao;
import dbutil.DBConn;

public class CounselorJoinDaoImpl implements CounselorJoinDao {

	private Connection conn = null;	//DB연결 객체
	private PreparedStatement ps = null;	//SQL 수행 객체
	private ResultSet rs = null;	//SQL 수행 결과 객체
	
	@Override
	public int selectIdForCheck(String id) {
		conn = DBConn.getConnection();	//DB 연결

		//수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT";
		sql += " count(*)";
		sql += " FROM COUNSELOR";
		sql += " WHERE counselorid = ?";

		int cnt = 0;

		try {
			ps = conn.prepareStatement(sql);	//수행 객체 얻기
			ps.setString(1, id);	//SQL쿼리의 ? 채우기
			rs = ps.executeQuery();				//SQL 수행 결과 얻기

			//SQL 수행결과 처리
			while(rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

}
