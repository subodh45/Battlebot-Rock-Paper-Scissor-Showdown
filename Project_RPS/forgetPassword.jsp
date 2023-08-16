<%@ page import="java.sql.*" %>

<html>
 <head>
  <title>Forget Password</title>
  <Style> 
   h1{background-color:grey;width:40%; border-radius:10px;}
   form{background-color:grey; width:40%;border-radius:10px; margin:5px;}
   body{background-image:url("https://static.vecteezy.com/system/resources/thumbnails/000/691/497/small/rock-paper-scissors-neon-icons.jpg");background-size: cover;}
   *{font-size: 50px;}
   a{text-decoration:none;}
   .error{background-color:grey;width:40%;}
   
  </Style>
  <link rel="icon" href="game.ico"/>

 </head>
 <body>
 <center>
<h1>Forget Password </h1>

       <form method="POST">
         <br/>
       <input type="text" name="un" placeholder="enter your username" pattern="[A-Za-z ]+"  title="enter alphabet only" required/> <br/> <br/>
       <input type="password" name="pswd" placeholder="enter change  password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,30}$" title="pass must contain 1 UL 1LL 1 SY 1NO 8Letter min" required/> <br/> <br/>
        <input type="password" name="pswd2" placeholder=" confirm change password" required/> <br/> <br/>
        <input type="submit" name="btn" value="change password"/> <br/>  <br/>
       <a href="index.jsp"><b style="color:black;"> Click here for Login </b></a>
       <br/>  
       </form>
 <div class="error">
<%

if (request.getParameter("btn")!=null)
 {    
          String un=request.getParameter("un");
          String pswd=request.getParameter("pswd");
          String pswd2=request.getParameter("pswd2");

       if(!pswd.equals(pswd2))
            {out.println("password didn not match ");
              return;     }

           if(pswd.length()<8)
            {out.println(" password must be min 8 character!! ");
              return;}
            
           if(un.trim().length()<2)
            {out.println(" username must be min 2 characteer!! ");
              return;}   
           
   try
    {     
          DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
          String url="jdbc:mysql://localhost:3306/auth_5jan23";
          Connection con=DriverManager.getConnection(url,"root","abc456"); 
          String sql="update users set password=? where username=?";  
          String sqll="select * from users where username=?";
          PreparedStatement pst=con.prepareStatement(sql);
          PreparedStatement pstt=con.prepareStatement(sqll);
          
          pst.setString(1,pswd);
          pst.setString(2,un);
          pstt.setString(1,un);

          ResultSet rs=pstt.executeQuery();
          if(rs.next())
            {    pst.executeUpdate();
                          out.println("password updated");
                        response.sendRedirect("index.jsp");
          } else   {out.println("invalid username");}
             
    
       
          con.close();
   

   }catch(SQLException er)
     {out.println("issue ");}
 }

%>
</div>
   </center>
 </body>

</html>