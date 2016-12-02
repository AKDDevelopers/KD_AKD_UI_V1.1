<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="MainApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Comments</title>
<%@include file="include/admin-link.jsp"%>
<style>
#PAGINATION{
	text-align:center;
}
</style>
</head>
<body ng-cloak class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@include file="include/admin-header.jsp"%>
		<%@include file="include/layout/left-side-bar.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Comments Tables <small>advanced tables</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active"><a href="#">Comment</a></li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content" ng-controller="CommentCtrl">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Comments Table</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Document</th>
										<th>Commented By</th>
										<th>Date</th>
										<th>Description</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="c in comment" ng-init="rowNumber= 10">
										<td>{{($index + ((filter.page - 1) * rowNumber)) + 1}}</td>
										<td>{{c.DOCUMENTS[0].TITLE | strLimit: 32}}</td>
										<td>{{c.USERS[0].USER_NAME}}</td>
										<td>{{c.CREATED_DATE}}</td>
										<td>{{c.REMARK}}</td>
										<td><span class="label label-success">{{c.STATUS}}</span></td>
										<td>
											<button type="button" class="btn btn-primary btn-sm"
												ng-click="getDataForUpdate(this)"
												data-toggle="modal"	data-target="#updateComment">
												<i class="fa fa-edit"></i>
											</button>
											<button type="button" class="btn btn-danger btn-sm"
															ng-click="alertDelete(c.COMMENT_ID)">
												<i class="fa fa-edit"></i>
											</button>
										</td>
									</tr>
									
								</tbody>

							</table>
							<div id="PAGINATION"></div>
						</div>
					</div>
					<!-- ============ Modal Start ================= -->
					
					<%@include file="include/update-comment.jsp"%>
					
					<!-- ============ Modal End   ================= -->				
				</div>
			</div>
		</div>


	</div>
	<%@include file="include/admin-script.jsp"%>
</body>
</html>