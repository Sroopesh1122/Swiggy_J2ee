<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.star {
	font-size: 2.5vh;
	cursor: pointer;
}

.one {
	color: rgb(255, 0, 0);
}

.two {
	color: rgb(255, 106, 0);
}

.three {
	color:#feb80a;
}

.four {
	color: #feb80a;
}

.five {
	color: rgb(24, 159, 14);
}
#emoji{
 font-size: 1.5rem;
 text-shadow: 3px 3px 4px rgba(0, 0, 0, 0.5), -1px -1px 2px rgba(255, 255, 255, 0.7);
}
</style>

<div class="custom-card">

	<span onclick="gfg(1)" class="star"><i class="ri-star-fill"></i></span> 
	<span onclick="gfg(2)" class="star"><i class="ri-star-fill"></i></span>
	<span onclick="gfg(3)" class="star"><i class="ri-star-fill"></i></span> 
	<span onclick="gfg(4)" class="star"><i class="ri-star-fill"></i></span> 
	<span onclick="gfg(5)" class="star"><i class="ri-star-fill"></i></span>
	<span id="emoji"></span>
</div>
 
<script>
let stars = 
    document.getElementsByClassName("star");
let output = 
    document.getElementById("output");
 
// Funtion to update rating
function gfg(n) {
    remove();
    for (let i = 0; i < n; i++) {
        if (n == 1) cls = "one";
        else if (n == 2) cls = "two";
        else if (n == 3) cls = "three";
        else if (n == 4) cls = "four";
        else if (n == 5) cls = "five";
        stars[i].className = "star " + cls;
    }
    $("#rating").val(n);
    updateEmoji(n);
}
 
// To remove the pre-applied styling
function remove() {
    let i = 0;
    while (i < 5) {
        stars[i].className = "star";
        i++;
    }
}


function updateEmoji(rat)
{
	if(rat === 1)
	{
		$("#emoji").html("&#x1F621;")
	}
	else if(rat === 2)
	{
		
		$("#emoji").html("&#x1F641;")
	}
	else if(rat === 3)
	{
		
		$("#emoji").html("&#x1F610;")
	}
	else if(rat === 4)
	{
		
		$("#emoji").html("&#x1F642;")
	}
	else if(rat === 5)
	{
		
		$("#emoji").html("&#x1F600;")
	}
	
}

</script> 