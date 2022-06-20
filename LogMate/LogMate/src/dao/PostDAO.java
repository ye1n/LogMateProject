package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.PostVO;

public class PostDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	final String SELECT_POST = "select * from post order by postno desc";
	final String INSERT_POST = "insert into post values(post_seq.nextval,?,?,?)";

	public ArrayList<PostVO> SelectPost() {
		ArrayList<PostVO> list = new ArrayList<>();
		PostVO vo = new PostVO();

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_POST);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int postno = rs.getInt("postno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");

				vo = new PostVO(postno, title, content, writer);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int AddPost(PostVO vo) {
		int cnt = 0;

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(INSERT_POST);

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());

			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}
}
