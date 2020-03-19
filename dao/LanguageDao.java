package dao;

import java.sql.*;
import java.util.*;

import vo.*;
import util.*;

public class LanguageDao {
	public ArrayList<Language> selectLanguageIdListAll() throws Exception{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT language_id, name FROM language";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Language> list = new ArrayList<Language>();
		while(rs.next()) {
			Language lang = new Language();
			lang.setLanguageId(rs.getInt("language_id"));
			lang.setName(rs.getString("name"));
			list.add(lang);
		}
		return list;
	}
}