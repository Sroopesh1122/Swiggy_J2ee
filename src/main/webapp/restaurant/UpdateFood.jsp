<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Name</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>

<style type="text/css">
 body {
	min-height: 100vh;
	width: 100%;
	font-family: "outfit", sans-serif;
	max-width: 1800px;
	margin: 0 auto;
	padding: 20px 0px;
}

.wrapper-section{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 80vh;
  padding: 30px 0px;
  gap:5px;
}

.add-food-form{
 width: 400px;
 padding: 30px;
 border-radius: 10px;
 box-shadow: 0px 1px 5px #efefef !important;
 border: 1px solid #efefef;
}

.add-food-form h4{
 font-size: 2.5rem;
 color:  #feb80a;
}

.form-footer{
 display: flex;
 justify-content: center;
 align-items: center;
 margin-top: 10px;
}

.form-footer button{
 background: #feb80a;
 border: 1px solid #feb80a !important;
}

.form-footer button:hover {
	color: black;
	background: white;
	border: 1px solid #feb80a !important;
}

.update-img-wrapper{
 padding: 10px;
 width: 400px;
 height: 400px;
 
}

.update-img-wrapper img{
 width: 100%;
 height: 100%;
 object-fit:cover;
 border-radius: 15px;
}

@media (width < 400px) {
	.add-food-form{
	 padding: 5px;
	 width: 300px;
	}
	
	.update-img-wrapper{
	 width: 300px;
	 height: 300px;
	 padding: 0px;
	}
	
}

@media (width < 850px) {
	.wrapper-section{
	 flex-direction: column;
	}
}

</style>

</head>
<body>
  <%@include file="/restaurant/Navbar.jsp"%>
  
   <section class="wrapper-section">
        
        
        <div class="update-img-wrapper">
            <img alt="" src="https://img.freepik.com/premium-photo/plate-food-with-different-foods-it-few-other-items-table_187678-1.jpg">       
        </div>
   
   
   
        <form action="" class="add-food-form" id="signin">
    
           <h4 class="text-center">Update Your Food</h4>



        <div class="form-group" >
                     <input type="text" class="form-control" placeholder="Name" name="email" id="email">
        </div>
        
         <div class="form-group" >
                     <input type="email" class="form-control" placeholder="email" name="email" id="email">
        </div>
         <div class="form-group" >
                     <input type="email" class="form-control" placeholder="email" name="email" id="email">
        </div>
         <div class="form-group" >
         <input type="email" class="form-control" placeholder="email" name="email" id="email">
        </div>


        <div class="form-group">
            <input type="text" class="form-control" name="password" id="password" placeholder="Password">
        </div>
        
        <div class="form-group">
            <input type="file" >
        </div>
        
             

        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Update</button>
        </div>
        
     
    
    </form>
       
   
   
   
   </section>
   
</body>
</html>