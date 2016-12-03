<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Main Categories</title>
<%@include file="include/admin-link.jsp"%>
<style>
.form-horizontal .form-group {
	margin-right: 20px;
	margin-left: 20px;
}
.btn-flat {
	border-radius: 0;
	margin-left: 20px;
}
#PAGINATION{
	text-align:center;
}
</style>
</head>
<body ng-cloak class="skin-blue sidebar-mini" ng-app="MainApp"
	ng-controller="MainCtrl">
	<%@include file="../user/include/image-loader.jsp"%>	
	<div class="wrapper">
		<%@include file="include/admin-header.jsp"%>
		<%@include file="include/layout/left-side-bar.jsp"%>
		
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Data Tables <small>advanced tables</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="dashboard"><i class="fa fa-dashboard"></i>Home</a></li>
				<li><a href="#">Categories</a></li>
				<li class="active">Main Categories</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Data Table With Full Features</h3>
							<br>
							<br>

							<button class="btn btn-flat btn-primary" data-toggle="modal"
								data-target="#addMainModal" ng-click="showCatBox=false">Add
								Categories</button>


							<button class="btn btn-flat btn-primary" data-toggle="modal"
								data-target="#addMainModal" ng-click="showCatBox=true">Add
								Sub Categories</button>

						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
									<th>#</th>
										<th>Name</th>
										<th>Sub Category of</th>
										<th>Doc Number</th>
										<th>Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="c in category" ng-init="rowNumber= 10">
										<td>{{($index + ((filter.page - 1) * rowNumber)) + 1}}</td>
										<td>{{c.CAT_NAME}}</td>
										<td>{{c.PARENT_NAME}}</td>
										<td>{{c.TOTAL_DOC}}</td>
										<td>{{c.CREATED_DATE}}</td>
										<td>{{c.STATUS}}</td>
<!-- 										<td>{{c.DOCUMENTS[0].TITLE | strLimit: 32}}</td> -->
										<td>
											<button type="button" class="btn btn-primary btn-sm" ng-click="getDataForUpdate(this)"
													data-toggle="modal"	data-target="#updateCategory">
												<i class="fa fa-edit"></i>
											</button>
											<button type="button" class="btn btn-danger btn-sm" ng-click="alertDelete(c.CAT_ID)">
												<i class="fa fa-eraser"></i>
											</button>
										</td>
									</tr>




								</tbody>
								<tfoot>

									<%@include file="include/modal_add_category.jsp"%>

								</tfoot>
							</table>
							<div id="PAGINATION"></div>
						</div>
						<!-- /.box-body -->
					</div>
					
					<!-- =======================update modal ========================= -->
				
					<%@include file="include/update-category.jsp"%>
					
					<!-- =======================end update modal ========================= -->
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> </section>
			<!-- /.content -->
		</div>

	</div>
<%@include file="include/admin-script.jsp"%>
</body>
</html>