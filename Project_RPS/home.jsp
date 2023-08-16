<html>
 <head>
<title> SPC GAME:home page</title>
<style>*{font-size:50px;}
  h1{border:5px solid black;width:50%; border-radius:12px; color:grey;background-color:azure;}
 body{background-image:url("https://i.pinimg.com/736x/a2/02/ff/a202ff44bf1c6d539eb954e916c796a2.jpg");}
 
.nav{background-color:grey;font-size:50px;text-align:left;}
.nav wlc{font-size:30px;}
.nav1{font-size:40px;float:right;margin-top:-55px;}
.nav1 input{font-size:40px}
.checkbox{border:5px solid goldenrod;width:50%; border-radius:12px; color:orange;background-color:grey;}
</style>
<link rel="icon" href="game.ico"/>
 </head>

 <body>
<center>
<div class="nav">
 
<%
    if(session.getAttribute("user")!=null)
     {
       String user=(String)session.getAttribute("user");
       String wlc="welcome " +user;
       out.println(wlc);
}else
  {  response.sendRedirect("index.jsp");}
%> 


<form>
   <input type="submit" value="logout" class="nav1" name="btn"/>
</form>
<% 
  if(request.getParameter("btn")!=null)
{   request.getSession().invalidate();
   response.sendRedirect("index.jsp");
}
%> 


</div>
  <h1>Stone Paper Scissor Game </h1>

<form>
 <b> <label style="border:5px solid goldenrod;width:50%; border-radius:12px; color:orange;background-color:grey;">What you want to choose? </label> <b/>
<br/><br/> <div class="checkbox"> <b> 
<input type="radio" value="Stone" name="SPC" checked="true" />Stone   
<input type="radio" value="Paper" name="SPC" />Paper  
<input type="radio" value="Scissor" name="SPC" />Scissor  <b/>
</div>
 <br/>
<input type="submit" value="Play Game" name="btnplay" />
</form>
<br/>

<% 
if(request.getParameter("btnplay")!=null)
{
   String SPC=request.getParameter("SPC");
    request.getSession().setAttribute("SPC",SPC);
   response.sendRedirect("result.jsp"); 
}

%>

</center>
 </body>

</html>