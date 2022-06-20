package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.JdbcUtil;
import vo.LoginVO;
import vo.MemberVO;

public class LogDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	final String INSERT_MEMBER = "insert into member values(?,?,?,?,?,?)";
	final String SELECT_ID = "select id from member where id=?";
	final String SELECT_LOGIN = "select id, pwd, nickname, intro from member where id=?";
	final String SELECT_MEMBER = "select * from member where id=?";
	final String UPDATE_MEMBER = "update member set name=?, pwd=?, nickname=?, intro=? where id=?";
	final String SELECT_THEME = "select theme from member";

	public String GetNowThemeColor(String id) {
		String themeColor = "";
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement("select theme from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				themeColor = rs.getString("theme");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("테마 컬러 가져오는 중 DAO 오류 발생");
		}
		return themeColor;
	}

	public int UpdateThemeColor(String id, String theme) {
		int cnt = 0;
		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement("update member set theme = ? where id = ?");

			pstmt.setString(1, theme);
			pstmt.setString(2, id);

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("테마 변경중 DAO 오류 발생");
		}
		// 성공 여부 반환
		return cnt;
	}

	// 회원 가입
	public int JoinMember(MemberVO vo) {
        int cnt = 0;

        try {
            con = JdbcUtil.getConnection();
            pstmt = con.prepareStatement(INSERT_MEMBER);

            pstmt.setString(1, vo.getName());
            pstmt.setString(2, vo.getId());
            pstmt.setString(3, vo.getPwd());
            pstmt.setString(4, vo.getNickname());
            pstmt.setString(5, vo.getIntro());
            pstmt.setString(6, "grey");

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cnt;
    }

	public int GetId(String id) {
		int result = -1;

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = -1;
				System.out.println(result);
			} else {
				result = 1;
				System.out.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public LoginVO Login(String Id) {
		LoginVO vo = new LoginVO();

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_LOGIN);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String pwd = rs.getString("pwd");
				String nickname = rs.getString("nickname");
				String intro = rs.getString("intro");
				vo = new LoginVO(Id, pwd, nickname, intro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	public MemberVO MemberList(String Id) {
		MemberVO vo = new MemberVO();

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_MEMBER);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String nickname = rs.getString("nickname");
				String intro = rs.getString("intro");
				vo = new MemberVO(name, id, pwd, nickname, intro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	public int UpdateMember(MemberVO vo) {
		int cnt = 0;

		try {
			con = JdbcUtil.getConnection();
			pstmt = con.prepareStatement(UPDATE_MEMBER);

			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickname());
			pstmt.setString(4, vo.getIntro());
			pstmt.setString(5, vo.getId());

			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

}
