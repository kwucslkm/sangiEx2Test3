package com.test.test3.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VoteDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","user1","1234");
		return con;
	}
	
	public int saveVote(String v_jumin, String v_name, String m_no, String v_time, String v_area, String v_confirm) throws Exception {
		con = getConnection();
		String sql = "insert into TBL_VOTE_202005 values (?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, v_jumin);
		pstmt.setString(2, v_name);
		pstmt.setString(3, m_no);
		pstmt.setString(4, v_time);
		pstmt.setString(5, v_area);
		pstmt.setString(6, v_confirm);
		
		int result = pstmt.executeUpdate();
		return result;
		
	}
	public List<VoteDTO> voteList() throws Exception {
		con = getConnection();
		String sql = "select v_name, "
				+ "            case "
				+ "                when substr(v_jumin,7,1)='1' "
				+ "                or substr(v_jumin,7,1)='2' then '19' "
				+ "                else '20' "
				+ "            end ||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일생' as 생년월일, "
				+ "            '만'||(to_number(to_char(sysdate,'yyyy'))- "
				+ "            to_number(to_char(case "
				+ "                when substr(v_jumin,7,1)='1' or substr(v_jumin,7,1)='2' then '19' "
				+ "                else '20' "
				+ "            end ||substr(v_jumin,1,2))))||'세' as 나이, "
				+ "            case "
				+ "                when substr(v_jumin,7,1)='1' or v_jumin = '3' then '남자' "
				+ "                else '여자' "
				+ "           end as 성별, "
				+ "               m_no, substr(v_time,1,2)||':'||substr(v_time,3,2)as 투표시간, "
				+ "               decode(v_confirm, 'Y','확인','N','미확인') 유권자확인 "
				+ "        from tbl_vote_202005";
		pstmt = con.prepareStatement(sql);
		List<VoteDTO> vList = new ArrayList<>();
		rs=pstmt.executeQuery();
		for(;rs.next();) {
			VoteDTO v = new VoteDTO();
			v.setV_name(rs.getString(1));
			v.setV_birth(rs.getString(2));
			v.setV_age(rs.getString(3));
			v.setV_gender(rs.getString(4));
			v.setM_no(rs.getString(5));
			v.setV_time(rs.getString(6));
			v.setV_confirm(rs.getString(7));
			vList.add(v);
		}
		return vList;
	}
	public List<MemberDTO> findMember() throws Exception {
		con = getConnection();
		String sql= "select m.m_no, m.m_name,p.p_name, decode(m.p_school,'1','고졸','2','학사','3','석사','4','박사') 학력, "
				+ "substr(m.m_jumin,1,6)||'-'||substr(m.m_jumin,7,7) as 주민 ,m.m_city, p.p_tel1||'-'||p.p_tel2||'-'||p.p_tel3 as tel "
				+ "from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code";
		pstmt = con.prepareStatement(sql);
		List<MemberDTO> mList = new ArrayList<>();
		rs = pstmt.executeQuery();
		while(rs.next()) {
			MemberDTO m = new MemberDTO();
			m.setM_no(rs.getString(1));
			m.setM_name(rs.getString(2));
			m.setP_name(rs.getString(3));
			m.setP_school(rs.getString(4));
			m.setM_jumin(rs.getString(5));
			m.setM_city(rs.getString(6));
			m.setP_tel(rs.getString(7));
			mList.add(m);
		}
		return mList;
	}
	
}
