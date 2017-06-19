package com.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class Expert_ClassificationJDBCDAO implements Expert_ClassificationDAO_interface{

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "ba101g3";
	private static final String PASSWORD = "baby";
		
	private static final String INSERT_STMT = "INSERT INTO expert_classification (exp_no,exp_cname) VALUES ('E'||LPAD(to_char(exp_no_seq.NEXTVAL), 3, '0'), ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM expert_classification ORDER BY exp_no";
	private static final String GET_ONE_STMT = "SELECT * FROM expert_classification WHERE exp_no = ?";
	private static final String UPDATE = "UPDATE expert_classification set exp_cname=? WHERE exp_no = ?";
	
	@Override
	public void insert(Expert_ClassificationVO expert_classificationVO){
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			String[] cols = { "exp_no" }; // ���ϥ�sequence���ͽs�����ܤ~�n�g
			pstmt = con.prepareStatement(INSERT_STMT, cols); // ���ϥ�sequence���ͽs�����ܤ~�n�g�ĤG�ӰѼ�
			pstmt.setString(1, expert_classificationVO.getExp_cname());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
    
	@Override
    public void update(Expert_ClassificationVO expert_classificationVO){
    	Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, expert_classificationVO.getExp_cname());
			pstmt.setString(2, expert_classificationVO.getExp_no());
			
			pstmt.executeUpdate();

			// Handle any DRIVER errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database DRIVER. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
    }
	
	@Override
	public Expert_ClassificationVO findByPrimaryKey(String exp_no){
		
		Expert_ClassificationVO expert_classificationVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, exp_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				expert_classificationVO = new Expert_ClassificationVO();
				expert_classificationVO.setExp_no(rs.getString("exp_no"));
				expert_classificationVO.setExp_cname(rs.getString("exp_cname"));
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return expert_classificationVO;
	}
	
	@Override
	public List<Expert_ClassificationVO> getAll(){
		List<Expert_ClassificationVO> list = new ArrayList<Expert_ClassificationVO>();
		Expert_ClassificationVO expert_classificationVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				// expert_classificationVO �]�٬� Domain objects
				expert_classificationVO = new Expert_ClassificationVO();
				expert_classificationVO.setExp_no(rs.getString("exp_no"));
				expert_classificationVO.setExp_cname(rs.getString("exp_cname"));
			
				list.add(expert_classificationVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	
    public static void main(String[] args) {

    	Expert_ClassificationJDBCDAO dao = new Expert_ClassificationJDBCDAO();

		// �s�W OK
//    	Expert_ClassificationVO expert_classificationVO1 = new Expert_ClassificationVO();
//    	expert_classificationVO1.setExp_cname("�ൣ�Ш|�M�a");
//		dao.insert(expert_classificationVO1);

		// �ק� OK
//		Expert_ClassificationVO expert_classificationVO2 = new Expert_ClassificationVO();
//		expert_classificationVO2.setExp_no("E001");
//		expert_classificationVO2.setExp_cname("�W�ť���");
//		dao.update(expert_classificationVO2);
//		System.out.println("��Ƥw�ק�");

		// �d�� OK
//		Expert_ClassificationVO expert_classificationVO3 = dao.findByPrimaryKey("E001");
//		System.out.print(expert_classificationVO3.getExp_no() + ",");
//		System.out.println(expert_classificationVO3.getExp_cname() + ",");
//		System.out.println("---------------------");

		// �d�� OK
//		List<Expert_ClassificationVO> list = dao.getAll();
//		for (Expert_ClassificationVO expert_classificationVO : list) {
//			System.out.print(expert_classificationVO.getExp_no() + ",");
//			System.out.print(expert_classificationVO.getExp_cname());
//			System.out.println();
//		}
	}
    
}