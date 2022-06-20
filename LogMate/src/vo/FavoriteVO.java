package vo;

public class FavoriteVO {
	private String myid;
	private String friendid;
	private String nickname;
	private String favorite;

	public FavoriteVO() {

	}

	public FavoriteVO(String myid, String friendid, String nickname, String favorite) {
		super();
		this.myid = myid;
		this.friendid = friendid;
		this.nickname = nickname;
		this.favorite = favorite;
	}

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getFriendid() {
		return friendid;
	}

	public void setFriendid(String friendid) {
		this.friendid = friendid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFavorite() {
		return favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
}