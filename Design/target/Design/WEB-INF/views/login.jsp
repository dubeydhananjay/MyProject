<%@include file="header.jsp" %>

    <h2>Login</h2><br><br>
  <form method="post" action="perform_login" class="form-inline">
    
     
  <div class="form-group">
    <label for="email">Username:</label>
    <input type="text" class="form-control" id="username" name="username">
  </div><br><br>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd" name="password">
  </div>
  
  <button type="submit" class="btn btn-default">Login</button>
</form>

<%@include file="footer.jsp" %>