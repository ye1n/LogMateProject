package vo;

public class PostVO {
	private int postno;
	private String title;
	private String content;
	private String writer;

	public PostVO() {

	}

	public PostVO(int postno, String title, String content, String writer) {
		super();
		this.postno = postno;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}

	public int getPostno() {
		return postno;
	}

	public void setPostno(int postno) {
		this.postno = postno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}