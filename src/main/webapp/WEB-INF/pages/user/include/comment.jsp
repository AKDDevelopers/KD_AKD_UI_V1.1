<%@ page pageEncoding="utf-8"%>

<%@taglib prefix='sec' uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication  property="principal.userID" var="userID"/>
	<sec:authentication  property="principal.name" var="userName"/>
	<sec:authentication  property="principal.email" var="userEmail"/>
	<sec:authentication  property="principal.profile" var="userProfile"/>
</sec:authorize>

<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/1.7.3/socket.io.js"></script>

<div id="commentBox" class="container-fluid"
<h3>បញ្ចេញមតិរបស់អ្នកចំពោះអត្ថបទនេះ</h3>
<form action="">
	<div id="img-user" class="col-md-1">
		<img alt="" data-ng-src="{{userInfoByUserID.PROFILE}}">
	</div>

	<div id="commentBoxArea" class="col-md-11">
		<textarea myEnter="insertComment()" placeholder = "សូមបញ្ចេញមតិរបស់អ្នក..." ng-model="newComment"></textarea>
		<div id="btnPost">
			<input type="button" value="ដាក់ប្រកាស" class="btn btn-primary" ng-click="insertComment()" ng-disabled="!newComment">
		</div>
	</div>

	<h4 class="text-left">ចំនួននៃការបញ្ចេញមតិ: <small class="label label-default">{{ countComment ? countComment :0 }} មតិ</small>  </h4>

	<br>
	<!-- <div id="btnPost">
        <input type="button" value="ដាក់ប្រកាស" class="btn btn-primary" ng-click="insertComment()" ng-disabled="!newComment">
    </div> -->
	<div class="container"  ng-if="commentByDoc" id="listCommentBox" ng-repeat="comment in commentByDoc">

		<div class="row">
			<div class="col-sm-1" id="img-user-commented">
				<div class="thumbnail">
					<img class="img-responsive user-photo" src={{comment.USERS[0].PROFILE}}>
				</div><!-- /thumbnail -->
			</div><!-- /col-sm-1 -->

			<div class="col-sm-11 text-left">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>{{comment.USERS[0].USER_NAME}}</strong> <span class="text-muted">commented {{ comment.CREATED_DATE | date:'yyyy-MMM-dd'}}</span>
					</div>
					<div class="panel-body">
						{{comment.REMARK}}
					</div><!-- /panel-body -->
				</div><!-- /panel panel-default -->
			</div><!-- /col-sm-5 -->


		</div><!-- /row -->

	</div>
	<!--<div ng-if="commentByDoc" id="listCommentBox" ng-repeat="comment in commentByDoc">
        <div id="img-user-commented">
            <img alt="" data-ng-src="{{API_PATH_ANGULAR}}/resources/img/user-profile/{{comment.USERS[0].PROFILE}}" class="image-user-commend">
            {{comment.USERS[0].USER_NAME}}
        </div>

        <div id="comment-list">
            <p class="comment">{{comment.REMARK}}</p>

        </div>
    </div>-->

</form>
</div>


<script>

</script>