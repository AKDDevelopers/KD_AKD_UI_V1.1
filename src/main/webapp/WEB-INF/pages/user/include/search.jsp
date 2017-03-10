<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       
<style>
.searchBlock
{
	width:400px;
	display:table-cell;
}
.input-group-btn:last-child>.btn
{
	padding-left: 5px;
}
button.searchBtn
{
	background-color: #106cc8;
}

</style>

<div class="searchBlock"> 
	
	<form action="/searchResult" id="frmSearch" method="GET">

		<div class="input-group">	
				<input type="text" class="form-control form-search" name="keyword"  id="keyword" placeholder="ស្វែងរក">
			   
			    <span class="input-group-btn">	    	
			    	<button class="btn btn-primary searchBtn">
				    	<span >&nbsp</span> <span class="glyphicon glyphicon-search"></span>
				    </button>
			    </span>
		</div>
	
	</form>
</div>