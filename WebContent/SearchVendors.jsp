<%@ page import="com.SwiftPackers.bean.UserBean" %>
<%@ page import="com.SwiftPackers.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Swift Packers</title>

<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Transporters web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web Designs" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--// Meta tag Keywords -->

<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="css/font-awesome.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {
    font-family: sans-serif; 
}
* {
    box-sizing: border-box;
}
h1 {
    color:black;
    margin-bottom: 30px;
}
.container1 {
    padding: 40px;
    margin: 0 auto;
    max-width: 1000px;
    text-align: center;
}
#charactersList {
    padding-inline-start: 0;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    grid-gap: 20px;
}
.character {
    list-style-type: none;
    background-color: #eaeaea;
    border-radius: 3px;
    padding: 10px 20px;
    display: grid;
    grid-template-columns: 3fr 1fr;
    grid-template-areas:
        'name image'
        'house image';
    text-align: left;
}
.character > h2 {
    grid-area: name;
    margin-bottom: 0px;
}
.character > p {
    grid-area: house;
    margin: 0;
    margin-top: -18px;
}
.character > img {
    max-height: 100px;
    grid-area: image;
}
#searchBar {
    width: 100%;
    height: 32px;
    border-radius: 3px;
    border: 1px solid #eaeaea;
    padding: 5px 10px;
    font-size: 12px;
}
#searchWrapper {
    position: relative;
}
#searchWrapper::after {
    content: '\1F50D';
    position: absolute;
    top: 7px;
    right: 15px;
}

</style>
</head>

<body>


   
  <!-- HEADER INCLUDE -->
   <%@include file="header.jsp" %>		
   
   
	<div class="banner1">
	</div>
	<div class="about-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="UserHome.jsp">Home</a><i>></i></li>
				<li>Search Vendors</li>
			</ul>
		</div>
	</div>
        <div class="container1">
            <div id="searchWrapper">
                <input
                    type="text"
                    name="searchBar"
                    id="searchBar"
                    placeholder="Search for a Vendor"
                />
            </div>
            <ul id="charactersList"></ul>
        </div>
        <script>
        const charactersList = document.getElementById('charactersList');
        const searchBar = document.getElementById('searchBar');
        let hpCharacters = [];

        searchBar.addEventListener('keyup', (e) => {
            const searchString = e.target.value.toLowerCase();

            const filteredCharacters = hpCharacters.filter((character) => {
                return (
                    character.name.toLowerCase().includes(searchString) ||
                    character.house.toLowerCase().includes(searchString)
                );
            });
            displayCharacters(filteredCharacters);
        });

        const loadCharacters = async () => {
            try {
                const res = await fetch('https://hp-api.herokuapp.com/api/characters');
                hpCharacters = await res.json();
                displayCharacters(hpCharacters);
            } catch (err) {
                console.error(err);
            }
        };

        const displayCharacters = (characters) => {
            const htmlString = characters
                .map((character) => {
                    return `
                    <li class="character">
                        <h2>${character.name}</h2>
                        <p>House: ${character.house}</p>
                        <img src="${character.image}"></img>
                    </li>
                `;
                })
                .join('');
            charactersList.innerHTML = htmlString;
        };

        loadCharacters();

        </script>



   <!-- footer -->
			<%@include file="footer.jsp" %>
	<!-- //footer -->



<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	
<!-- //js-scripts -->

<!-- start-smoth-scrolling -->
<script src="js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {					
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- //here ends scrolling icon -->
<!-- start-smoth-scrolling -->

</body>
</html>