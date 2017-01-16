<%@include file="header.jsp" %><br>
<form:form method = "post" commandName="userDetail">
<div align="center">
<div class="row">
    	<div class="col-md-6 col-md-offset-2">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h2 class="panel-title">Are You A Buyer Or A Supplier?</h2>
			 	</div>
			  	<div class="panel-body">

<input name="_eventId_edit" type="submit" value="I am Buyer" /> <span>
<input name="_eventId_submit" type="submit" value="I am Supplier" /></span></div>
</div></div></div></div>
</form:form>
<%@include file="footer.jsp" %>