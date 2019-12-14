<%-- 
    Document   : index
    Created on : Dec 13, 2019, 2:18:19 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/thura_jsp","root","");
        pst =con.prepareStatement("insert into records(stname,course,fee)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();
    
%>
<script>
    alert("record added");
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

    <title>JSP</title>
  </head>  <body>
      <div class="container mt-4">
          <h1>Student Registration system</h1>
          <div class="row">
              <div class="col-lg-5">
                  <form method="POST" action="#">
                      <div class="form-group">
                    <label for="exampleInputEmail1">Student Name</label>
                    <input type="text" class="form-control" name="sname" id="exampleInputEmail1" >
                    
                  </div>
                      
                  <div class="form-group">
                    <label for="course">Course</label>
                    <input type="text" class="form-control" name="course" id="course">
                  </div>
                  
                  <div class="form-group">
                    <label for="fee">Fee</label>
                    <input type="text" class="form-control" name="fee" id="fee">
                  </div>
                      
                      
                 
                      <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                  </form>
              </div> 
<!--              col-lg-5 end-->
              <div class="col-lg-7">
                  <table class="table">
                <thead>
                    <tr>
                    <th scope="col"></th>
                    <th scope="col">Name</th>
                    <th scope="col">Course</th>
                    <th scope="col">Fee</th>
                    <th ></th>
                  
                  </tr>
                </thead>
                <tbody>
                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/thura_jsp","root","");
                        
                        String query = "select * from records";
                        Statement st = con.createStatement();
                        
                        rs = st.executeQuery(query);
                        
                        while(rs.next()){
                            String id = rs.getString("id");
                       
                    %>
                    
                  <tr>
                    <th scope="row"></th>
                    <td><%=rs.getString("stname") %></td>
                    <td><%=rs.getString("course") %></td>
                    <td><%=rs.getString("fee") %> MMK</td>
                    
                    <td>
                        <a href="update.jsp?id=<%=id%>" class="btn btn-outline-warning">Edit</a>
                        <a href="delete.jsp?id=<%=id%>" class="btn btn-outline-danger">Delete</a>
                    </td>
                  </tr>
                    <%  } %>
                </tbody>
              </table>
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