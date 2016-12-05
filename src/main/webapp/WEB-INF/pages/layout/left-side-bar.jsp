<%@ page pageEncoding="utf-8"%>

<style>

.skin-blue .sidebar-menu>li.header {
    background: #058e63;
    padding: 18px;
    text-align: center;
    font-size: 15px;
    font-weight: bold;
    color: white;
}

.skin-blue .sidebar-menu>li>.treeview-menu {
    background: white;
}

.skin-blue .wrapper, .skin-blue .main-sidebar, .skin-blue .left-side {
    background-color: white;
}

.skin-blue .sidebar a {
    color:black;
}

.skin-blue .treeview-menu>li.active>a, .skin-blue .treeview-menu>li>a:hover {
    color: black;
    background: white;
}

.skin-blue .treeview-menu>li {
    color: black;
    background: white;
}

.skin-blue .treeview-menu>li>a{
	padding: 12px 5px 12px 15px;
}
.skin-blue .treeview-menu>li>a:hover{
	background: #5bd05b;
}



.skin-blue .treeview-menu>li>a {
    color: black;
}

.main-sidebar, .left-side
{
	padding-top: 0px;
}
.skin-blue .sidebar-menu>li:hover>a, .skin-blue .sidebar-menu>li.active>a{
	color: black;
    background: #00b050;
    border-left-color: #3c8dbc;
}
.skin-blue .treeview-menu>li>a {
    padding: 12px 5px 12px 28px;
}
.sidebar {
    background-color: white;
}
</style>
 
  
 
   <aside class="main-sidebar###">
    <section class="sidebar">
      <ul class="sidebar-menu">    
        <li class="header"> <i class="{{getCategoryByID.ICON}}"></i> {{getCategoryByID.CAT_NAME}}</li>
        
        <li class="treeview" ng-repeat="sub1 in parentCategory" ng-init="sub1.ICON='fa fa-th-large'" ng-click="getAllDocumentByCatID(sub1.CAT_ID);getTotalDocByCatID(sub1.TOTAL_DOC);test($event)">   
           <a href="#" >
            <i class="{{sub1.ICON}}"></i> <span>{{sub1.CAT_NAME}}	</span>
            <span class="pull-right-container">
            
              <i ng-if="sub1.TOTAL_SUB>0" class="fa fa-angle-left pull-right"></i>
              <span class="label label-primary pull-right">{{sub1.TOTAL_DOC}}</span>
            </span>
          </a>
          <ul class="treeview-menu">

            <li ng-repeat="sub2 in sub1.SUB_CATEGORIES" ng-init="sub2.ICON='fa fa-star'" ng-click="getAllDocumentByCatID(sub2.CAT_ID);getTotalDocByCatID(sub2.TOTAL_DOC);test($event)">
              <a href="#"><i class="{{sub2.ICON}}"></i> {{sub2.CAT_NAME}}
                <span class="pull-right-container">
                  <i ng-if="sub2.TOTAL_SUB>0" class="fa fa-angle-left pull-right"></i>
                  <span class="label label-primary pull-right">{{sub2.TOTAL_DOC}}</span>
                </span>
              </a>
                         
              <ul class="treeview-menu">        
                 <li ng-repeat="sub3 in sub2.SUB_CATEGORIES" ng-init="sub3.ICON='fa fa-heart'" ng-click="getAllDocumentByCatID(sub3.CAT_ID);getTotalDocByCatID(sub3.TOTAL_DOC);test($event)">
                  <a href="#"><i class="{{sub3.ICON}}"></i> {{sub3.CAT_NAME}}
                    <span class="pull-right-container">
                    
                      <i ng-if="sub3.TOTAL_SUB>0" class="fa fa-angle-left pull-right"></i>
                      <span class="label label-primary pull-right">{{sub3.TOTAL_DOC}}</span>
                    </span>
                  </a>
                  <ul class="treeview-menu">
                    <li ng-repeat="sub4 in sub3.SUB_CATEGORIES" ng-init="sub4.ICON='fa fa-gear'" ng-click="getAllDocumentByCatID(sub4.CAT_ID);getTotalDocByCatID(sub4.TOTAL_DOC);test($event)">
                    	<a href="#">
                    		<i class="{{sub4.ICON}}"></i> {{sub4.CAT_NAME}} 
                    		<span class="pull-right-container label label-primary pull-right">{{sub4.TOTAL_DOC}}</span>
                    	</a>
                    </li>
                  </ul>
                </li>
                
              </ul>
            </li>
          </ul>
        </li>
        
      </ul>
    </section>
  </aside>
  
