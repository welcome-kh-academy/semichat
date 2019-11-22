package dto;

public class Counselor {
	private int counselorNo;
	private String counselorName;
	private String counselorId;
	private String counselorPassword;
	private String counselorNickname;
	private String counselorEmail;
	private String counselorPhonenumber;
	private String counselorSigndate;
	private String counselorPosition;
	private int counselorMarketingagree;
	private int counselorEmailchecked;
	private int managerConfirm;
	private int corporationNo;
	@Override
	public String toString() {
		return "Counselor [counselorNo=" + counselorNo + ", counselorName=" + counselorName + ", counselorId="
				+ counselorId + ", counselorPassword=" + counselorPassword + ", counselorNickname=" + counselorNickname
				+ ", counselorEmail=" + counselorEmail + ", counselorPhonenumber=" + counselorPhonenumber
				+ ", counselorSigndate=" + counselorSigndate + ", counselorPosition=" + counselorPosition
				+ ", counselorMarketingagree=" + counselorMarketingagree + ", counselorEmailchecked="
				+ counselorEmailchecked + ", managerConfirm=" + managerConfirm + ", corporationNo=" + corporationNo
				+ "]";
	}
	public int getCounselorNo() {
		return counselorNo;
	}
	public void setCounselorNo(int counselorNo) {
		this.counselorNo = counselorNo;
	}
	public String getCounselorName() {
		return counselorName;
	}
	public void setCounselorName(String counselorName) {
		this.counselorName = counselorName;
	}
	public String getCounselorId() {
		return counselorId;
	}
	public void setCounselorId(String counselorId) {
		this.counselorId = counselorId;
	}
	public String getCounselorPassword() {
		return counselorPassword;
	}
	public void setCounselorPassword(String counselorPassword) {
		this.counselorPassword = counselorPassword;
	}
	public String getCounselorNickname() {
		return counselorNickname;
	}
	public void setCounselorNickname(String counselorNickname) {
		this.counselorNickname = counselorNickname;
	}
	public String getCounselorEmail() {
		return counselorEmail;
	}
	public void setCounselorEmail(String counselorEmail) {
		this.counselorEmail = counselorEmail;
	}
	public String getCounselorPhonenumber() {
		return counselorPhonenumber;
	}
	public void setCounselorPhonenumber(String counselorPhonenumber) {
		this.counselorPhonenumber = counselorPhonenumber;
	}
	public String getCounselorSigndate() {
		return counselorSigndate;
	}
	public void setCounselorSigndate(String counselorSigndate) {
		this.counselorSigndate = counselorSigndate;
	}
	public String getCounselorPosition() {
		return counselorPosition;
	}
	public void setCounselorPosition(String counselorPosition) {
		this.counselorPosition = counselorPosition;
	}
	public int getCounselorMarketingagree() {
		return counselorMarketingagree;
	}
	public void setCounselorMarketingagree(int counselorMarketingagree) {
		this.counselorMarketingagree = counselorMarketingagree;
	}
	public int getCounselorEmailchecked() {
		return counselorEmailchecked;
	}
	public void setCounselorEmailchecked(int counselorEmailchecked) {
		this.counselorEmailchecked = counselorEmailchecked;
	}
	public int getManagerConfirm() {
		return managerConfirm;
	}
	public void setManagerConfirm(int managerConfirm) {
		this.managerConfirm = managerConfirm;
	}
	public int getCorporationNo() {
		return corporationNo;
	}
	public void setCorporationNo(int corporationNo) {
		this.corporationNo = corporationNo;
	}
	
}
