
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My first</title>
</head>
<body>
<% 

	String name=request.getParameter("name");
	String pass=request.getParameter("pass");
	try
{
		

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
		System.out.println("connected");
		PreparedStatement ps=con.prepareStatement("insert into java values(?,?)");
		ps.setString(1, name);
		ps.setString(2, pass);
		
		ps.executeUpdate();
		System.out.println("data inserted successfully");
		
		
		ResultSet rs=ps.executeQuery("select * from java");
		
		while(rs.next())
		{
		String a=rs.getString(1);
		String b=rs.getString(2);
		System.out.println(a+ " "+ b);
		}
		
		con.close();
		
	}		
		catch(Exception e)
		{
			System.out.println(e);
		}
	
%>
<%="Your process Completed" %>
</body>
</html>