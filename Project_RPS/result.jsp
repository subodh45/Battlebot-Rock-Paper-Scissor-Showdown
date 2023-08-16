<html>
 <head>
<title>SPC GAME:Result page</title>
<style>*{font-size:50px;}
  h1{border:5px solid black;width:50%; border-radius:12px; color:grey;background-color:azure;}
 body{background-image:url("https://i.pinimg.com/736x/a2/02/ff/a202ff44bf1c6d539eb954e916c796a2.jpg");}
 .java{color:goldenrod; border: 5px solid goldenrod;border-radius:10px;
   background-color:grey; }
.nav{background-color:grey;font-size:50px;text-align:left;}
.nav1{font-size:40px;text-align:right;margin-top:-55px;}
.nav1 input{font-size:40px}
.uimg{text-align:left;margin-left:55px;}
.pcimg{text-align:right;margin-right:55px; margin-top:-350px;}
.res{ margin-top:-0px;}
</style>
<link rel="icon" href="game.ico"/>
 </head>

 <body>
<center>

<%  
    if(session.getAttribute("user")!=null)
     { %> <div class="nav"> <%
       String u=(String)session.getAttribute("user");
       out.println("Hope you enjoy  " +u + "!!"); 
    
%>  </div>
     <h1>Stone Paper Scissor Game </h1>
   <div class="java">
<% 
         
  if(session.getAttribute("SPC")!=null)
    {  
       String user=(String)session.getAttribute("SPC");
   %><div class="uimg"> <%  out.println("you selected =" + user);
    
    if (user.equals("Stone"))
{ %><br/> <img src="stone.png" alt="" width="300" height="300"> <%}
     
    if (user.equals("Paper"))
{ %><br/> <img src="paper.jpg" alt="" width="300" height="300"> <%}
      
    if (user.equals("Scissor"))
{ %><br/> <img src="scissor.jpg" alt="" width="300" height="300"> <%}


 %> </div>
<%
       String str[]= new String[]{"Stone","Paper","Scissor"};  
       String pc=str[(int)(Math.random()*3)];
%>  <div class="pcimg"> <%
       out.println(" computer selected= " + pc);
     if (pc.equals("Paper"))
       { %> <br/> <img src="paper.jpg" alt="" width="300" height="300">  <% }
      if (pc.equals("Stone"))
       { %> <br/> <img src="stone.png" alt="" width="300" height="300">  <% }
       if (pc.equals("Scissor"))
       { %> <br/> <img src="scissor.jpg" alt="" width="300" height="300">  <% }
%><br/> </div>
<div class=res>
<%
      String res="";
%></div> <%
      {
        if(user.equals("Stone"))
         {
          if(pc.equals("Paper"))          {  res=" OPPS! You Loose";
           out.println( res ); }
          else if(pc.equals("Scissor"))   { res=" YEAH!! YOU Win";
            out.println(res);}
          else                            { res=" Tie game";
            out.println(res);}
         }
  
         else if(user.equals("Paper"))
         {
          if(pc.equals("Scissor"))     { res=" OPPS! You Loose";
           out.println(res);}
          else if(pc.equals("Stone"))  {  res=" YEAH!! YOU Win";
           out.println(res);}
          else                         {  res=" tie game";
           out.println(res);}
           }

          else if(user.equals("Scissor"))
          {
           if(pc.equals("Paper"))       { res=" YEAH!! YOU Win";
            out.println(res);}
           else if(pc.equals("Stone"))  { res=" OPPS! You Loose";
            out.println(res); }
           else                         {res=" tie game";
            out.println(res);}
           }
        }
     
    }

else 
    {  
       response.sendRedirect("home.jsp");
    }

%><br/>
</div>

<%

     }else
        { response.sendRedirect("index.jsp");}
%> 

<br/>
<form>
 <input type="submit" value="Play Again" name="replaybtn"/>
</form>
<% 
  if(request.getParameter("replaybtn")!=null)
{  
   response.sendRedirect("home.jsp");
}
%> 


</center>
 </body>

</html>