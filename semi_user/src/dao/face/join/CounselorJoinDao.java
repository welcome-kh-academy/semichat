package dao.face.join;

public interface CounselorJoinDao {

	/**
	 * 조홍철
	 * 2019-11-22
	 *  입력한 아이디를 DB에서 조회
	 * @param id - 회원가입 시 상담원이 입력한 아이디
	 * @return int - 1이면 중복, 0이면 중복 아님
	 */
	public int selectIdForCheck(String id);
}
