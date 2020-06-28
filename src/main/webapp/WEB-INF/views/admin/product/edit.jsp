<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>


<html>
<head>
<title>edit product</title>
</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>

				<li><a href="#">Forms</a></li>
				<li class="active">Form Elements</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div id="global" class="page-content">
			<div class="row">
				<div class="col-xs-12">
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">
						${message}
					</div>
				</c:if>
				<!-- in form spring, method modelAtrribute = model is used to mapping the entity columns of model at the form names --> 
					<form:form commandName="item" class="form-horizontal" id="fileUploadForm" action="save-product" method="post" Name="item" modelAttribute="item" enctype="multipart/form-data">
				
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="sel1">categories:</label>
								<div class="col-sm-9">
								<form:select path="categoryCode" id="categoryCode">
									<form:option value="" label="-- categories --"/>		
									<form:options items="${categories}"/>
								</form:select>
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> name item</label>
							<div class="col-sm-9">
								<form:input path="name" cssClass="col-xs-10 col-sm-5" id="name" name="name" />
							</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> price </label>
							<div class="col-sm-9">
								<form:input path="price" cssClass="col-xs-10 col-sm-5" id="price" name="price" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> thumbnail </label>
							<div class="col-sm-9">
								<form:input path="thumbnail" Class="col-xs-10 col-sm-5" type = "file" id="thumbnail" name="thumbnail" multiple="multiple"/>
							</div>
						</div>
						<div class="form-group">							
							<label for="shortDescription" class="col-sm-3 control-label no-padding-right" >description</label>
							<div class="col-sm-9">
									<form:textarea path="description" cssClass="col-xs-10 col-sm-5" rows="5" name="description" id="description"/>
							</div>	
						</div>
						<div class="form-group">
							<label for="content" class="col-sm-3 control-label no-padding-right">content</label>
							<div class="col-sm-9">
									<form:textarea path="content" cssClass="col-xs-10 col-sm-5" rows="5" name ="content" id="content"/>
							</div>
						</div>
						<form:hidden path="id" id="newId"/>
						<div class="form-group">
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<button class="btn btn-info" id="submit" type="submit" >
											<i class="ace-icon fa fa-check bigger-110"></i> 
											update item
										</button>
									</c:if>
									
									<c:if test="${empty model.id}">
										<p id="buttons" >
										
											<input id="reset" type="reset" tabindex="4" class="btn" > 
											
											
											<input id="submit" type="submit" tabindex="5" value="Add Product" class="btn btn-info" >
										</p>
										<!-- <button class="btn btn-info" type="submit" id="submit" name="submit">
											<i class="ace-icon fa fa-check bigger-110"></i>
											 them bai viet
										</button> -->
									</c:if>

										&nbsp; &nbsp; &nbsp;
										<!-- <button class="btn" type="reset">
											<i class="ace-icon fa fa-undo bigger-110"></i> huy
										</button> -->
									</div>
								</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
</script>
</body>
</html>
