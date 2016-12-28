<%@ page pageEncoding="utf-8"%>


<div class="modal fade" id="addMainModal" role="dialog" >
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Category</h4>
			</div>
			<div class="modal-body">
				<form role="form">
					<div class="box-body">
						<div class="form-group">
							<label for="categoryTitle">Category Title</label> <input
								type="text" class="form-control"
								placeholder="Category title " name="folderName"
								ng-model="folderName">
						</div>

						<div class="form-group">
							<label for="categoryTitle">Category Icon</label>
							<input type="text" class="form-control" placeholder="Icon"
								ng-model="catIcon">
						</div>
						<div class="form-group">
							<label for="categoryTitle">Category Thumbnail</label>
							<input type="file" class="form-control" placeholder="Icon"
								ng-model="catThumbnail" id="file">
						</div>


						<div class="form-group"​ ng-show="!showCatBox">
							<label for="categoryTitle">Category Order Numberaa</label>
							<input type="number" class="form-control" placeholder="Order Number"
								ng-model="catNumOrder">
						</div>

						<div class="form-group" ng-show="showCatBox">
							<label>Select Level: </label> {{selectedLevel}}
							<select class="form-control" ng-model="selectedLevel" data-ng-change="getAllCategoryByLevel(selectedLevel-1)">
		                        <option ng-repeat="level in subCategoryLevel" value="{{level.LEVEL_NUM}}">{{level.LEVEL_DES}}</option>
		                   	</select>
						</div>

						<div class="form-group" ng-show="showCatBox">
							<label>Select its parent:</label>
							<select class="form-control" ng-model="ParentID">
		                        <option ng-repeat="cat in allCategoryByLevel" value="{{cat.CAT_ID}}">{{cat.CAT_NAME}}</option>
		                   	</select>
						</div>


						<!-- <div class="form-group" ng-show="showCatBox">
							<label>Category:</label>
							<select class="form-control" ng-model="ParentID">
		                        <option ng-repeat="cat in allCategoryNewFun | filter:{CAT_LEVEL:'0'}" value="{{cat.CAT_ID}}">{{cat.CAT_NAME}}</option>
		                   	</select>
						</div> -->


						<div class="form-group">
							<label for="description">Description</label>
							<textarea class="form-control"
								placeholder="Description..." rows="4" ng-model="des"></textarea>
						</div>

						<div class="form-group">
							<div class="radio">
								<label> Status </label><br /> <label> <input
									ng-model="sta" type="radio" name="rdoResult"
									ng-value="'1'"> Enable
								</label> <label> <input ng-model="sta" type="radio"
									name="rdoResult" ng-value="'0'"> Disable
								</label>
							</div>
						</div>
				</form>
			</div>
			<div class="modal-footer">
				<!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				<input type="submit" class="btn btn-primary btn-flat"
					value="Submit" ng-click="uploadImage()">
			</div>
		</div>

	</div>

</div>
