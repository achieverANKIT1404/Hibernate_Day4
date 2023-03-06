<%@page import="entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="org.hibernate.Session"%>
        <%@page import="org.hibernate.SessionFactory"%>
        <%@page import="org.hibernate.Transaction"%>
        <%@page import="org.hibernate.cfg.Configuration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <%
  	    Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		SessionFactory factory = cfg.buildSessionFactory();
		Session session1 = factory.openSession();
		
		Transaction tx = session1.beginTransaction();
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String address = request.getParameter("address");
		
		Customer cus = new Customer(fname,lname,address);
		
		request.getRequestDispatcher("index.html").include(request, response);
		out.print("<p style='color:green; text-align:center;'>Data Inserted Successfully</p>");
		
		session1.save(cus);
		tx.commit();
		session1.close();
      %>
      
</body>
</html>