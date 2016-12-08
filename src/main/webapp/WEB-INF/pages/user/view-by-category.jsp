<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>${PAGE_TITLE}</title>

<%@include file="include/link/link.jsp"%>

	<!--  New Code -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ionicons/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/AdminLTE/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/AdminLTE/css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/userAccount.css">

<style>
.footer{
	background-color: #374458;
	width: 100% !important;
	height:50% !important;
	color:  white;
	margin-top: 30px;
	text-align:left;
	word-wrap:break-word !important;
}
a.thumbnail {
    text-decoration: none;
    border: 1px solid #fff;
    border-top-color: rgb(229, 230, 233);
    border-right-color: rgb(223, 224, 228);
    border-bottom-color: rgb(208, 209, 213);
    border-left-color: rgb(223, 224, 228);
    min-height: 338.79px;
}

/*  SEARCH BLOCK	*/

.typeahead-demo .custom-popup-wrapper {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    background-color: #f9f9f9;
  }

  .typeahead-demo .custom-popup-wrapper > .message {
    padding: 10px 20px;
    border-bottom: 1px solid #ddd;
    color: #868686;
  }

  .typeahead-demo .custom-popup-wrapper > .dropdown-menu {
    position: static;
    float: none;
    display: block;
    min-width: 160px;
    background-color: transparent;
    border: none;
    border-radius: 0;
    box-shadow: none;
  }
  
  .skin-blue .wrapper, .skin-blue .main-sidebar, .skin-blue .left-side {
    margin-top: 10px;
}
.content-wrapper, .right-side {
    background-color: transparent;
}
.main-sidebar{
	min-height: 0%;
}
.content-container{
	margin-top: 15px;
}

#left-side-nav {
    z-index: 2;
}
  
</style>

</head>
<body ng-cloak ng-app="UserApp" ng-controller="UserCtrl" data-ng-init="getCategoryByParentID('${ParentID}')" class="hold-transition skin-blue sidebar-mini" id="userCtrl">
	<jsp:include page="include/register.jsp"></jsp:include>
	<jsp:include page="include/login.jsp"></jsp:include>
	<jsp:include page="include/upload.jsp"></jsp:include>
	<%@include file="include/image-loader.jsp"%>			 
	<header id="header">
		<jsp:include page="include/header.jsp"></jsp:include>
	</header>
	<jsp:include page="include/social-share.jsp"></jsp:include>
	<jsp:include page="include/toolbar-right.jsp"></jsp:include>
	<jsp:include page="include/feedback.jsp"></jsp:include>
	
	<content>
		<div id="page-content-wrapper">
			<div class="container" id="container-cate">
				<section id="cates-view">
					<div class="row section nav-left topspace-cates#">					
						<div class="row-nav-left-content" ng-cloak>
							<div class="row">
							   <div class="col-sm-3" id="left-side-nav" >
							   
							   <!--  <ul class="category-menu nav nav-pills nav-stacked">
							   	   		 <li class="bg-cate">
							   	   		 	<span>
							   	   		 		<i class="{{getCategoryByID.ICON}}"></i>
					  	   					</span>
					  	   					{{getCategoryByID.CAT_NAME}}
					  	   				</li>
					  	   				<li  class="cates-main " ng-repeat="parentCat in parentCategory" ng-click="getAllDocumentByCatID(parentCat.CAT_ID);getTotalDocByCatID(parentCat.TOTAL_DOC)"> 
					  	   					<a data-toggle="pill">{{parentCat.CAT_NAME}} ( <b>{{parentCat.TOTAL_DOC}}</b>​ )</a> 
					  	   				</li>			  	   				
							   	   </ul>  -->
							   
							    <%@include file="../layout/left-side-bar.jsp"%>	
							   					   	   
							   </div>
						  		<div class="col-sm-9" ng-if="parentCategory[0]">	
									<div  class="body-cates tab-content content-container">							
										<div id="documentBox" class="tab-pane fade in active" ng-init="getAllDocumentByCatID(parentCategory[0].CAT_ID)">								
											<div ng-if="documentByCatID != null" ng-repeat="slide in documentByCatID track by $index" class="col-lg-4 col-sm-6 col-xs-12">											    											    
									      		<input   type="hidden" class="form-control" value="{{slide.USER_ID}}" id="slide_user_id">									      		
												<%@include file="include/slide-layout.jsp"%>												
											</div>											
										</div>																									
									</div>
									 <div ng-if="recordNotFound" class="noRecord">
										<img data-ng-src="${pageContext.request.contextPath}/resources/user/img/cat-no-doc.png">
									</div>								
								</div>  
								<div class="col-sm-3"></div>	
								<div class="col-sm-9">
									<div id="PAGINATION_DOC_BY_CAT" style="text-align: center;" ng-show="!recordNotFound"></div>
								</div>														
							</div>							
						</div>		
					</div>
		  		</section>
	  		</div> 
	 	</div>  
	</content>

	  <footer>
		<%-- 	<jsp:include page="include/footer.jsp"></jsp:include> --%>
	   </footer>
	   
	
	 <%@include file="include/script/script.jsp"%>
	 
	 <!-- New code here -->
	<script src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/plugins/AdminLTE/js/app.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/AdminLTE/js/demo.js"></script>
</body>
</html>
