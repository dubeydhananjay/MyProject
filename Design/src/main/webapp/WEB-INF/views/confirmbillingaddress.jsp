<%@include file="header.jsp" %><br>
<h2>Confirm Billing Address</h2>
<form:form method="post" modelAttribute="billingAddress">
					<form:label path="streetAddress1">Street Address1:</form:label>${billingAddress.streetAddress1}
					<br /><br />
					<form:label path="streetAddress2">Street Address2:</form:label>${billingAddress.streetAddress2}
					<br /><br />
					<form:label path="landmark">Landmark:</form:label>${billingAddress.landmark}
					<br /><br />
					<form:label path="city">City:</form:label>${billingAddress.city}
					<br /><br />
					<form:label path="district">District:</form:label>${billingAddress.district}
					<br /><br />
					<form:label path="pinCode">PinCode:</form:label>${billingAddress.pinCode}
					<br /><br />
					<form:label path="state">State:</form:label>${billingAddress.state}
					<br /><br />
					<input name="_eventId_edit" type="submit" value="Edit" /> 
					<input name="_eventId_submit" type="submit" value="confirm" />
					<input name="_eventId_cancel" type="submit" value="Cancel" /><br>
					</form:form>
<%@include file="header.jsp" %>