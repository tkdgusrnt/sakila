package dao;

import java.sql.*;
import java.util.*;

import util.*;

public class StoreDao {
	public ArrayList<Integer> selectStoreIdList() throws Exception{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT store_id FROM store";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Integer> list = new ArrayList<Integer>();
		while(rs.next()) {
			list.add(rs.getInt("store_id"));
		}
		return list;
	}
}