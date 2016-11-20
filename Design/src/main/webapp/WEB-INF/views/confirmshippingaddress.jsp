<%@include file="header.jsp" %><br>
<h2>Confirm Shipping Address</h2>
<form:form method="post" modelAttribute="shippingAddress">
					<form:label path="streetAddress1">Street Address1:</form:label>${shippingAddress.streetAddress1}
					<br /><br />
					<form:label path="streetAddress2">Street Address2:</form:label>${shippingAddress.streetAddress2}
					<br /><br />
					<form:label path="landmark">Landmark:</form:label>${shippingAddress.landmark}
					<br /><br />
					<form:label path="city">City:</form:label>${shippingAddress.city}
					<br /><br />
					<form:label path="district">District:</form:label>${shippingAddress.district}
					<br /><br />
					<form:label path="pinCode">PinCode:</form:label>${shippingAddress.pinCode}
					<br /><br />
					<form:label path="state">State:</form:label>${shippingAddress.state}
					<br /><br />
					<input name="_eventId_edit" type="submit" value="Edit" /> 
					<input name="_eventId_submit" type="submit" value="confirm" />
					<input name="_eventId_cancel" type="submit" value="Cancel" /><br>
					</form:form>
<%@include file="header.jsp" %>