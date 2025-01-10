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

input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    
  }
  .error{
	font-size: 0.7rem;
	color: red;
	margin-left: 0.5rem;
}
</style>

</head>
<body>
  <%@include file="/restaurant/Navbar.jsp"%>
  
   <section class="wrapper-section">
        
        
        <div class="update-img-wrapper">
            <img alt="" src="https://img.freepik.com/premium-photo/plate-food-with-different-foods-it-few-other-items-table_187678-1.jpg">       
        </div>
   
   
   
        <form action="" class="add-food-form" id="updatefood">
    
           <h4 class="text-center">Update Your Food</h4>

		<div class="form-group" >
                     <input type="text" class="form-control" placeholder="Name" name="name" id="name">
        </div>
        
         <div class="form-group" >
                     <input type="text" class="form-control" placeholder="Description" name="description" >
        </div>
         <div class="form-group" >
                     <input type="number" class="form-control" placeholder="Price" name="price" id="price" min="1">
        </div>
         <div class="form-group" >
         <input type="text" class="form-control" placeholder="Category" name="category" id="category">
        </div>
        
        <div class="form-group">
            <input type="file" >
        </div>   

        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Update</button>
        </div>
        
     
    
    </form>
       
   
   
   
   </section>
   <script>
   $(document).ready(function () {
	    $("#updatefood").validate({
	        rules: {
	            name: {
	                required: true,
	                minlength: 3
	            },
	            description: {
	                required: true,
	                minlength: 5
	            } ,
	            price:{
	            	required: true
	            },
	            category:{
	            	required: true
	            }
	            
	        },
	        messages: {
	        	 name: {
	                 required: "Please enter food name",
	                 minlength: "Name must be at least 3 characters long"
	             },
	             description: {
	            	 required: "Please enter description",
	                 minlength: "Description must be at least 5 characters long"
	             } ,
	             price:{
	            	 required: "Please enter price",
	             },
	             category:{
	            	 required: "Please enter category",
	             }
	            },
	       
	        errorElement: "div",
	        
	        errorPlacement: function (error, element) {
	            error.addClass("error");
	            error.insertAfter(element);
	        },
	        highlight: function (element) {
	            $(element).addClass("is-invalid").removeClass("is-valid");
	        },
	        unhighlight: function (element) {
	            $(element).addClass("is-valid").removeClass("is-invalid");
	        }
	    });
	});
</script>
</body>
</html>