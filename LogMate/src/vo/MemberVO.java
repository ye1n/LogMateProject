package vo;

public class MemberVO {
	private String name;
	private String id;
	private String pwd;
	private String nickname;
	private String intro;
//	theme
	private String theme;

	public MemberVO() {

	}

	public MemberVO(String name, String id, String pwd, String nickname, String intro) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.intro = intro;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	// theme
	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}
	
}