
<%@ page import="java.sql.*" %>

<html>
  <head>
   <title>SPC GAME:Login Page</title>  
  <style>
h1{background-color:grey;width:40%; border-radius:10px;}
   form{background-color:grey; width:40%;border-radius:10px; margin:5px;}
   body{background-image:url("https://static.vecteezy.com/system/resources/thumbnails/000/691/497/small/rock-paper-scissors-neon-icons.jpg");background-size: cover;}
   *{font-size: 50px;}
   a{text-decoration:none;}
   .error{background-color:grey;width:40%;}
</style>
<link rel="icon" href="game.ico"/>
  </head>
   <body>
     <center>
    <h1>Login Page</h1>
     <form method="POST" >
     <br/>
       <input type="text" name="un" placeholder="enter your username" required/> <br/> <br/>
       <input type="password" name="pswd" placeholder="enter your password" required/> <br/> <br/>
        <input type="submit" name="btn" value="login"/> <br/> 
       <a href="forgetPassword.jsp" style="color:black; font-size:15px;"><u>forget Password?</u></a><br/>
       <a href="signup.jsp"><b style="color:black; mb:6px;">Click for registation</b></a>
      
       <br/> 
      </form>
       
        <%  if(request.getParameter("btn")!=null)
         {
             String un=request.getParameter("un");
             String pswd=request.getParameter("pswd");
           
          try{
 
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
              String url="jdbc:mysql://localhost:3306/auth_5jan23";
              Connection con=DriverManager.getConnection(url,"root","abc456");
              String sql="select * from users where username=? and password=?";
              PreparedStatement pst=con.prepareStatement(sql);
              pst.setString(1,un);
              pst.setString(2,pswd);
              ResultSet rs=pst.executeQuery();
             
             if(rs.next())
            {   request.getSession().setAttribute("user",un);
                response.sendRedirect("home.jsp");
                
          } else 
     %>
         <div class="error">
   
     <%
         {out.println("invalid login");}
     
      

        
         }catch(SQLException er )
          {
            out.println("isuue" + er);
         }
      %>
            
           </div>
     <%
          }
         
        %> 
    
     
       
    </center>
   </body>

</html>