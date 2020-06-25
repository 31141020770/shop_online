<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Add Product Form</title>
<style type="text/css">
@import
url(
"<c:url value="
/
css
/main.css"/>");
</style>
</head>
<body>
	<div id="global">
		<form:form commandName="product" id="fileUploadForm" action="save-product" method="post" Name="product"
			enctype="multipart/form-data">
			<fieldset>
				<legend>Add a product</legend>
				<p>
					<label for="name">Product Name: </label>
					<form:input id="name" path="name" name="name" />
					
				</p>
				<p>
					<label for="description">Description: </label>
					<form:input id="description" path="description" name="description" />
				</p>
				<p>
					<label for="price">Price: </label>
					<form:input id="price" path="price"  name="price" cssErrorClass="error" />
				</p>
				<p>
					<label for="image">Product Image: </label> <input type="file"
						name="images" id="images"/>
				</p>
				<p id="buttons">
					<input id="reset" type="reset" tabindex="4"> 
					<input id="submit" type="submit" tabindex="5" value="Add Product">
				</p>
				<button class="btn btn-info" type="submit" id="submit123" name="submit123">
				submit
				</button>
			</fieldset>
			
		</form:form>
	</div>
</body>
<script>
</script>

</html>