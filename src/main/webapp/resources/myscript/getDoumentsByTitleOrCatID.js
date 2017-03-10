	var getCurrentPage = 1;
	var totalPage = 0;
	
	var catID 		= "";

	var docTitle 	= ""; 
	var page 		= 1; 
	var limit 		= 12;

	console.log(keyword);

    if(keyword != null || keyword  != ""){
        docTitle = keyword;
//        console.log(1);
        $("#keyword").val(keyword);
    }else{
        docTitle ="";
//        console.log(2);
	}
	
	$(document).ready(function() {
    
		showMainPageData = function(){ 
    		$.ajax({
    			url :"http://docs-api.khmeracademy.org/api/v1/get-categories",
				method: 'GET',
				success:function(data){
					console.log(data);
					
					if(data.DATA != null){
						displayCategory(data);					
					}
					
				}
			});	
    	};
    	
    	getDocumentsByDocTitleOrCatID = function(catID , docTitle , page,  limit){
    		console.log("Title : " + docTitle);
    		$.ajax({
    			url :"http://docs-api.khmeracademy.org/api/v1/get-documents-by-doc-title-or-cat-id?cat-id="+catID+"&doc-title="+docTitle+"&page="+page+"&limit="+limit,
				method: 'GET',
				success:function(data){
					console.log(data);
					if(data.DATA.length > 0 ){
						$("#oopSearch").hide();
						//$("#getDocuments").empty();
						$("#documents_tmpl").tmpl(data.DATA).appendTo("#getDocuments");
						
						if(page >= data.PAGINATION.TOTAL_PAGES){ 
							$("#btnLoadMore").hide();
						}else{
							$("#btnLoadMore").show();
						}
					}else{
						$("#oopSearch").show();
						$("#btnLoadMore").hide();
					}
				
					
					$("#docLoading").hide();
					
				}
			});	
    	};
    	
    	$(document).on('click',"#btnLoadMore" , function(){    
			page++;
			$("#btnLoadMore").hide();
			$("#docLoading").show();
//			alert($("#keyword").val());
			getDocumentsByDocTitleOrCatID(catID , $("#keyword").val() , page,  8);
		});
    	
    	$(document).on('click',".listByMainCategory" , function(){  
    		$("#getDocuments").empty();
    		$("#docLoading").show();
			page = 1;
			catID = $(this).data("id");
			getDocumentsByDocTitleOrCatID(catID , $("#keyword").val() , page,  12 ); 
			$(".getTextMain").text($(this).text());
		});
    	
    	$("#frmSearch").submit(function(event){
    		event.preventDefault();
    		$("#docLoading").show();
    		$("#getDocuments").empty();
//    		alert($("#keyword").val());
    		getDocumentsByDocTitleOrCatID(catID , $("#keyword").val() , page,  12 ); 
    	});
    	
    	
    	getDocumentsByDocTitleOrCatID("" , docTitle , page,  limit);
    	showMainPageData();
       	
	});
	
	
	 function displayCategory(data){
		 $("#categories").empty();
		 
		 categories = '';
		// alert(data.length);
		 for(i=0;i<data.DATA.length;i++){
			 categories+= '<div id="collapseOne" class="panel-collapse">';
			 categories+= '<button style="width:100%;background-color: #26a63c;color:white" type="button" class="btn level1"  data-toggle="collapse" href="#'+i+'">'+data.DATA[i].CAT_NAME+'</button>';
				 
			// Level 2
			var link ="#";
			var data_id ="";
			if(data.DATA[i].subCategories != 0){
				
				categories += '<div class="collapse in" id="'+i+'">';
				categories += '<ul class="nav">';
				for(j=0;j<data.DATA[i].SUB_CATEGORIES.length;j++){
					link = '/#elearning/course/'+data.DATA[i].SUB_CATEGORIES[j].CAT_ID;
					data_id ="data-id='"+data.DATA[i].SUB_CATEGORIES[j].CAT_ID+"' class='listByMainCategory'";
					var caret ="";
					// Level 3
					var cate3 = '';
					if(data.DATA[i].SUB_CATEGORIES[j].SUB_CATEGORIES != 0){
						link = "#";
						data_id ="";
						var cate3 = '<ul class="sub-nav">';
						for(k=0;k<data.DATA[i].SUB_CATEGORIES[j].SUB_CATEGORIES.length;k++){
							caret = '<span class="caret pull-right"></span>';
							cate3 += '<li><a href="/#elearning/course/'+data.DATA[i].SUB_CATEGORIES[j].SUB_CATEGORIES[k].CAT_ID+'" class="listByMainCategory" data-id="'+data.DATA[i].SUB_CATEGORIES[j].SUB_CATEGORIES[k].CAT_ID+'">'+data.DATA[i].SUB_CATEGORIES[j].SUB_CATEGORIES[k].CAT_NAME+'</a></li>';
						}
						cate3 += '</ul>';
					}
					
					categories += '<li><a href="'+link+'" '+data_id+' > -- '+data.DATA[i].SUB_CATEGORIES[j].CAT_NAME + caret +'</a>';
					categories += cate3;
					categories += "</li>";
				}
				categories += '</div>';
				categories += '</ul>';
			}
			 
			 
			 
			 categories+='<div>';
		 }
		 
		 $("#categories").append(categories);
		 
	 }
	 