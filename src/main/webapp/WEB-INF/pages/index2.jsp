 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
	 
<!DOCTYPE html>
<html>
<head>
<title>ទំព័រដើម | All Khmer Docs</title>
<%@include file="user/include/link/link.jsp"%>

<link href="${pageContext.request.contextPath}/resources/vertical-menu.css" rel="stylesheet">

<style>
.shortenString {
    white-space: nowrap;
    width: 90%;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>

</head>
<body ng-app="UserApp" ng-controller="UserCtrl">		

	<jsp:include page="user/include/register.jsp"></jsp:include>
	<jsp:include page="user/include/login.jsp"></jsp:include>
	<jsp:include page="user/include/upload.jsp"></jsp:include>
	<jsp:include page="user/include/save-list.jsp"></jsp:include>
	
	<%@include file="user/include/image-loader.jsp"%>	
	
				  
	<header id="header">
		<jsp:include page="user/include/header.jsp"></jsp:include>
	</header>	
	<jsp:include page="user/include/social-share.jsp"></jsp:include>
	<jsp:include page="user/include/feedback.jsp"></jsp:include>
	
		
		
		<div class="container">		
		
		
		
		<div class="col-md-3 sideMenu" style="margin-top:20px;padding-left: 0px;">
															<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
																	<div class="panel panel-default" style="overflow: visible;">
																	
																		<!-- BEGIN SUBJECT -->
																		
																		<div id="categories">
																		
																				<div  class="loading text-center" ><img src="${pageContext.request.contextPath}/resources/myscript/loading.gif"></div>
																		
																		</div>		    
																	    
																	   
																	   
															
																	</div>
															</div>
		</div>
			
			
				
		<div class="col-md-9">
		
						<div class="row section popular topspace-second" data-ng-init="getDocumentByRecommended()"> 
									<div class="popular-title">
										<h2 class="section-title">
											<span id="left" class="getTextMain">ឯកសារថ្មីៗ</span>
											<!-- <span id="right">
												<a href="/feature/popular">បង្ហាញទាំងអស់</a>
											</span> -->
										</h2>
									 </div>
									
									
									
									<!-- Documents -->
							 		<div id="getDocuments">
							 		
							 			
							 		
							 		
							 		</div>
							 		
							 	<div style="padding:20px;display:none" id="oopSearch">
							 		<h1>No results for : </h1> <h3>Please try another search.</h3>
							 	</div>
								
								
								
								<div id="divBtnLoadMore" class="row text-center">
							 			<button style="display:none" id="btnLoadMore" class="btn btn-success">ច្រើនទៀត</button>
							   </div>
							   
							   
							   <div  id="docLoading" class="row text-center" ><img src="${pageContext.request.contextPath}/resources/myscript/loading.gif"></div>
		
		
		</div>			            		
							            		
						</div>	            		
							            		
			
		</div>
		
	
	<footer>
		<jsp:include page="user/include/footer.jsp"></jsp:include>
	</footer>
	
	<%@include file="user/include/script/script.jsp"%>
	<script>var keyword = "";</script>
	<!-- jQuery Template -->
	<script src="${pageContext.request.contextPath}/resources/myscript/getDoumentsByTitleOrCatID.js"></script>
	<script src="${pageContext.request.contextPath}/resources/myscript/jquery.tmpl.min.js"></script>
	
	<script id="documents_tmpl" type="text/x-jquery-tmpl">
										<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ng-scope">
										
											<a href="/detail/{{= DOC_ID}}" class="thumbnail">
												<span class="img">
													<img alt="{{= TITLE}}" src="{{= THUMBNAIL_URL }}">  
												</span>
												<span class="title shortenString">{{= TITLE }}</span>
												<span class="user-name">{{= USERS.USER_NAME }}</span>
												<span class="view-count"><span>{{= VIEW }}</span> <i  class="fa fa-eye"></i></span>
												<input type="text" value="https://drive.google.com/thumbnail?&amp;sz=w320&amp;id=1nnZYUl1Uh62N_hhDmOMeO8VuvQVPklwddqbFthPES0s" id="thubnail"  class="ng-hide">
												<span class="socials"></span>
											</a>
							
											<a href="{{= EXPORT_LINK }}" alt="download" class="download" target="_blank">
												<span><i class="fa fa-arrow-circle-o-down" aria-hidden="true"></i></span>
											</a>
											<a href="#" alt="share" class="share" ng-click="FBShare({{= DOC_ID }}, {{= THUMBNAIL_URL }})">
												<span><i class="fa fa-share-alt" aria-hidden="true"></i></span>
											</a>
											
								 		</div>					

																						
	</script>
	
</body>
</html>