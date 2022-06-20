package vo;

public class FriendVO {
	private String myid;
	private String friendid;
	private String favorite;

	public FriendVO() {

	}

	public FriendVO(String myid, String friendid, String favorite) {
		super();
		this.myid = myid;
		this.friendid = friendid;
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

	public String getFavorite() {
		return favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
}