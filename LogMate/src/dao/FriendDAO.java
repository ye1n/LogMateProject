package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.FavoriteVO;
import vo.FriendVO;

public class FriendDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	final String SELECT = "select my_id, nickname, friend_id, favorite from member m, friend f where my_id=? and m.id = f.friend_id order by nickname";
	final String SELECT_FRIEND = "select * from friend where my_id=? order by friend_id";
	final String DELETE_FRIEND = "delete from friend where my_id=? and friend_id=?";
	final String INSERT_FRIEND = "insert into friend values(?,?,?)";
	final String UPDATE_FRIEND = "update friend set favorite=? where my_id=? and friend_id=?";

	// 친구 목록
	public ArrayList<FriendVO> FriendList(String Id) {
		ArrayList<FriendVO> list = new ArrayList<>();
		FriendVO vo = new FriendVO();

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_FRIEND);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String myid = rs.getString("my_id");
				String friendid = rs.getString("friend_id");
				String favorite = rs.getString("favorite");

				vo = new FriendVO(myid, friendid, favorite);
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 즐겨찾기 목록
	public ArrayList<FavoriteVO> FavoriteList(String Id) {
		ArrayList<FavoriteVO> list = new ArrayList<>();
		FavoriteVO vo = new FavoriteVO();

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECT);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String myid = rs.getString("my_id");
				String friendid = rs.getString("friend_id");
				String nickname = rs.getString("nickname");
				String favorite = rs.getString("favorite");

				vo = new FavoriteVO(myid, friendid, nickname, favorite);
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 친구 삭제
	public int DeleteFriend(String myid, String friendid) {
		int cnt = 0;

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(DELETE_FRIEND);
			pstmt.setString(1, myid);
			pstmt.setString(2, friendid);

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 친구 업데이트(즐겨찾기 설정 여부)
	public int UpdateFriend(FriendVO vo) {
		int cnt = 0;

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(UPDATE_FRIEND);

			pstmt.setString(1, vo.getFavorite());
			pstmt.setString(2, vo.getMyid());
			pstmt.setString(3, vo.getFriendid());

			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 미완성 친구 추가
	public int AddFriend(FriendVO vo) {
		int cnt = 0;

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(INSERT_FRIEND);

			pstmt.setString(1, vo.getMyid());
			pstmt.setString(2, vo.getFriendid());
			pstmt.setString(3, vo.getFavorite());

			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}
}