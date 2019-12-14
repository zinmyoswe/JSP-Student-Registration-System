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
    if(request.getParameter("update")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/thura_jsp","root","");
        pst =con.prepareStatement("update records set stname=?, course=? , fee=? where id=?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();
    
%>
<script>
    alert("Updated successfully");
</script>

<%
}
%>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>JSP Update</title>
  </head>  <body>
      <div class="container mt-4">
          <h1>Student Update</h1>
          <div class="row">
              <div class="col-lg-5">
                  <form method="POST" action="">
                      <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/thura_jsp","root","");
                        
                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("select * from records where id=?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){
                      %>
                      <div class="form-group">
                    <label for="exampleInputEmail1">Student Name</label>
                    <input type="text" class="form-control" name="sname" value="<%= rs.getString("stname")%>" id="exampleInputEmail1" >
                    
                  </div>
                      
                  <div class="form-group">
                    <label for="course">Course</label>
                    <input type="text" class="form-control" name="course" value="<%= rs.getString("course")%>" id="course">
                  </div>
                  
                  <div class="form-group">
                    <label for="fee">Fee</label>
                    <input type="text" class="form-control" name="fee" value="<%= rs.getString("fee")%>" id="fee">
                  </div>
                      
                      <% } %>
                 
                      <button type="submit" class="btn btn-warning" name="update">Update</button>
                      <a href="index.jsp" class="btn btn-outline-primary">Back</a>
                  </form>
              </div> 
<!--              col-lg-5 end-->
              <div class="col-lg-7">
                 
              </div> 
<!--              col-lg-7 end-->
              
          </div>
      </div>
      

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>