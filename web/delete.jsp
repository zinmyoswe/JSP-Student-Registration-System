<%-- 
    Document   : update
    Created on : Dec 13, 2019, 5:46:26 PM
    Author     : Dell
--%>

<%-- 
    Document   : index
    Created on : Dec 13, 2019, 2:18:19 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
        String id = request.getParameter("id");       
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/thura_jsp","root","");
        pst =con.prepareStatement("delete from records where id=?");
        pst.setString(1, id);
        pst.executeUpdate();
    
%>
<script>
    alert("Deleted Record");
</script>
<script>window.location='index.jsp'</script>



