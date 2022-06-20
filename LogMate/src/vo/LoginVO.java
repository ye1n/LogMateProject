package vo;

public class LoginVO {
	private String id;
	private String pwd;
	private String nickname;
	private String intro;

	public LoginVO() {

	}

	public LoginVO(String id, String pwd, String nickname, String intro) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.intro = intro;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
}