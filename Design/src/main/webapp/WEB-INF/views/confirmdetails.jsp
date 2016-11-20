<%@include file="header.jsp" %><br>

<form:form method="post" modelAttribute="userDetail">
					<form:label path="username">UserName:</form:label>${userDetail.username}
					<br /><br />
					<form:label path="emailId">Email Id:</form:label>${userDetail.emailId}
					<br /><br />
					
					<form:label path="firstname">First Name :</form:label>${userDetail.firstname}
					<br /><br />
					<form:label path="lastname">Last Name :</form:label>${userDetail.lastname}
					<br /><br />
					<form:label path="contactNo">contact No :</form:label>${userDetail.contactNo}
					<br /><br />
					<form:label path="alternateContactNo">Alternate contact No :</form:label>${userDetail.alternateContactNo}
					<br /><br />
					<!-- for triggering webflow events using form submission,
					 the eventId to be triggered is given in "name" attribute as:
					-->
					<input name="_eventId_edit" type="submit" value="Edit" /> 
					<input name="_eventId_submit" type="submit" value="confirmdetails" /><br>
				</form:form>
		

<%@include file="footer.jsp" %>