package service.face.join;

public interface CounselorJoinService {


	/**
	 * 조홍철
	 * 2019-11-22
	 * 
	 * 아이디 중복 검사
	 * 
	 * @param id - 회원 가입 시 상담원이 입력한 아이디
	 * @return int - 1이면 중복, 0이면 중복 아님
	 */
	
	public int counselorIdCheck(String id);
}
