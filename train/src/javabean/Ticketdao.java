package javabean;
import javabean.Ticketbean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class Ticketdao {
	    
	    //订票
	    public boolean update(Connection connection, String checi) throws SQLException
	    {
			boolean value = false;
			PreparedStatement statement = null;
			Statement st = connection.createStatement();
			ResultSet resultSet = null;
			String sql = "select shengyu from ticket where checi = ?";		
				// 获得PreparedStatement对象，并填充
				statement = connection.prepareStatement(sql);
				statement.setString(1,checi);
				resultSet = statement.executeQuery();
				if(resultSet.next())
				{	
					int x = Integer.parseInt(resultSet.getString(1));
					if(x >= 1){
						sql = "update ticket set shengyu = shengyu - 1";
						int t = st.executeUpdate(sql);
//						System.out.println("======================"+t);
//						value = st.execute(sql);//对数据进行修改
//						System.out.println("======================"+value);
						//System.out.println("===="+checi+"====="+qidian+"===="+zhongdian);
						if(t == 1) value = true;
						return value;
					}
				}			
			
				try
				{
					if(resultSet != null) resultSet.close();
					if(statement != null) statement.close();
				}
				catch (SQLException e)
				{
				}
			return value;
	  }
  
	    //查询所有的票，用于显示
	    public List querycheci(Connection connection, String checi) throws SQLException
	    {
	    	List list = new ArrayList();
	    	String sql = "select checi,qidian,zhongdian,a_time,g_time,price,yupiao from ticket where checi = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1,checi);
			ResultSet resultSet = statement.executeQuery();
			Ticketbean ticket = null;
			while(resultSet.next())
			{
				ticket = new Ticketbean();
				ticket.setCheci(resultSet.getString("checi"));
				ticket.setQidian(resultSet.getString("qidian"));
				ticket.setZhongdian(resultSet.getString("zhongdian"));
				ticket.setA_time(resultSet.getString("a_time"));
				ticket.setG_time(resultSet.getString("g_time"));
				ticket.setPrice(resultSet.getInt("price"));
				ticket.setYupiao(resultSet.getInt("yupiao"));
				list.add(ticket);
			}	
			try
			{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
			}
			catch (SQLException e)
			{
			}
	
			return list;
	    }
	

	    public List queryqz(Connection connection, String qidian,String zhongdian) throws SQLException
	    {
	    	List list = new ArrayList();
	    	String sql = "select checi,qidian,zhongdian,a_time,g_time,price,yupiao from ticket where checi = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(2,qidian);
			statement.setString(3,zhongdian);
			ResultSet resultSet = statement.executeQuery();;
			Ticketbean ticket = null;
			while(resultSet.next())
			{
				ticket = new Ticketbean();
				ticket.setCheci(resultSet.getString("checi"));
				ticket.setQidian(resultSet.getString("qidian"));
				ticket.setZhongdian(resultSet.getString("zhongdian"));
				ticket.setA_time(resultSet.getString("a_time"));
				ticket.setG_time(resultSet.getString("g_time"));
				ticket.setPrice(resultSet.getInt("price"));
				ticket.setYupiao(resultSet.getInt("yupiao"));
				list.add(ticket);
			}
			try
			{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
			}
			catch (SQLException e)
			{
			}
	
			return list;
	    }
	  //添加所有的票，用于显示
	    public int add(Connection connection, String checi,String qidian,String zhongdian,String a_time,String g_time,int price,int yupiao) throws SQLException
	    {
	    	int value = -1;
	    	String sql = "insert into ticket(checi,qidian,zhongdian,a_time,g_time,price,yupiao) values(?,?,?,?,?,?,?)";
			PreparedStatement statement = null;
			try{	
				statement = connection.prepareStatement(sql);
				statement.setString(1,checi);
	            statement.setString(2,qidian);
	            statement.setString(3,zhongdian);
	            statement.setString(4,a_time);
	            statement.setString(4,g_time);
	            statement.setInt(5,price);
	            statement.setInt(6,yupiao);
	            value=statement.executeUpdate();
			}catch (SQLException ex)
	        {
	            ex.printStackTrace();
	        }
			finally
			{
			    try
				{
					if(statement != null) statement.close();
				}
				catch (SQLException ex)
				{
				}
			}		
			return value;
	    }
	}

