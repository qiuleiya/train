package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
 
import com.train.javabean.Userbean;
import com.train.DB.*;
public class UserDao {
 
	//查询所有（查）
	@SuppressWarnings("finally")
	public ArrayList findAll()  throws Exception{
		Connection con=null;
		PreparedStatement psta=null;
		ResultSet rs=null;
		ArrayList list=new ArrayList();
		String sql="select * from users";
		try{
			con=DatebaseDao.getConnection();
			psta=con.prepareStatement(sql);
			rs=psta.executeQuery();
			while(rs.next()){
				Userbean obj=new Userbean();
				obj.setUsername(rs.getString(1));
				obj.setPassword(rs.getString(2));
				obj.setRepassword(rs.getString(3));
				obj.setRealName(rs.getString(4));
				obj.setGender(rs.getString(5));
				obj.setTel(rs.getString(6));
				obj.setEmail(rs.getString(7));
				list.add(obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatebaseDao.close(rs, psta, con);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
	}
	
	//插入方法（增）
	@SuppressWarnings("finally")
	public boolean save(Userbean obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="insert into users values(?,?,?,?,?,?,?)";
		boolean flag=false;
		try{
			con=DatebaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getUsername());
			psta.setString(2, obj.getPassword());
			psta.setString(3, obj.getRepassword());
			psta.setString(4, obj. getRealName());
			psta.setString(5, obj.getGender());
			psta.setString(6, obj.getTel());
			psta.setString(7, obj.getEmail());
			flag=psta.executeUpdate()>0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatebaseDao.close(null, psta, con);
			}catch(Exception e){
				e.printStackTrace();
			}
			return flag;
		}
	}
	
	//删除方法（删）
	@SuppressWarnings("finally")
	public boolean remove(String username){
		Connection con=null;
		PreparedStatement psta=null;
		boolean flag=false;
		String sql="delete from users where username=?";
		try{
			con=DatebaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, username);
	
			flag=psta.executeUpdate()>0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatebaseDao.close(null, psta, con);
			}catch(Exception e){
				e.printStackTrace();
			}
			return flag;
		}
	}


	//通过id修改，为更新做准备的（改）
			@SuppressWarnings("finally")
			public Userbean findByusername(String username){
				Connection con=null;
				PreparedStatement psta=null;
				ResultSet rs=null;
				Userbean obj=null;
				String sql="select * from users where username=?";
				try{
					con=DatebaseDao.getConnection();
					psta=con.prepareStatement(sql);
					psta.setString(1, username);
					rs=psta.executeQuery();
					if(rs.next()){
						
						obj=new Userbean();
						obj.setUsername(rs.getString(1));
						obj.setPassword(rs.getString(2));
						obj.setRepassword(rs.getString(3));
						obj.setRealName(rs.getString(4));
						obj.setGender(rs.getString(5));
						obj.setTel(rs.getString(6));
						obj.setEmail(rs.getString(7));
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						DatebaseDao.close(rs, psta, con);
					}catch(Exception e){
						e.printStackTrace();
					}
					return obj;
				}
			}
	
	//更新方法（修改数据）（改）
	@SuppressWarnings("finally")
	public boolean update(Userbean obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="update userinfo set user_name=?,user_sex=?,user_age=?,user_hobby=?,user_city=?,mtext=? where id=?";
		boolean flag=false;
		try{
			con=DatebaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getUsername());
			psta.setString(2, obj.getPassword());
			psta.setString(3, obj.getRepassword());
			psta.setString(4, obj. getRealName());
			psta.setString(5, obj.getGender());
			psta.setString(6, obj.getTel());
			psta.setString(7, obj.getEmail());
			flag=psta.executeUpdate()>0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatebaseDao.close(null, psta, con);
			}catch(Exception e){
				e.printStackTrace();
			}
			return flag;
		}
	}
	
	
}
