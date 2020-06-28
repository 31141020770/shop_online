<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>

<html>
<head>
<title>edit category</title>
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
					<form:form commandName="item" class="form-horizontal" id="fileUploadForm" action="save-category" method="post" Name="item" modelAttribute="item" enctype="multipart/form-data">
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> name </label>
							<div class="col-sm-9">
								<form:input path="name" cssClass="col-xs-10 col-sm-5" id="name" name="name" />
							</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> code </label>
							<div class="col-sm-9">
								<form:input path="code" cssClass="col-xs-10 col-sm-5" id="code" name="code" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> thumbnail </label>
							<div class="col-sm-9">
								<form:input path="thumbnail" Class="col-xs-10 col-sm-5" type = "file" id="thumbnail" name="thumbnail" multiple="multiple"/>
							</div>
						</div>
				
						<form:hidden path="id" id="newId"/>
						<div class="form-group">
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<button class="btn btn-info" id="submit" type="submit" >
											<i class="ace-icon fa fa-check bigger-110"></i> 
											update 
										</button>
									</c:if>
									
									<c:if test="${empty model.id}">
										<p id="buttons">
											<input id="reset" type="reset" tabindex="4"> 
											<input id="submit" type="submit" tabindex="5" value="Add Product">
										</p>
										<button class="btn btn-info" type="submit" id="submit" name="submit">
											<i class="ace-icon fa fa-check bigger-110"></i>
											add
										</button>
									</c:if>

										&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset">
											<i class="ace-icon fa fa-undo bigger-110"></i> huy
										</button>
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
