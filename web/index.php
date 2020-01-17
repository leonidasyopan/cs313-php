<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<title>Home | CS 313 by Leonidas Yopan</title>

	<!-- This is the main stylesheet for the whole website -->
	<link rel="stylesheet" href="css/main-styles.css" type="text/css">
</head>
<body>
	<header>
	<?php include $_SERVER['DOCUMENT_ROOT'] . '/common/header.php'; ?> 
	</header> 

	<main class="content-width">
		
		<section id="professional-profile">
			<div id="profile-headings">
				<h2 id="heading-name">Leonidas Yopan</h2>
				<h3 id="heading-title">Web Designer and Developer. Self proclaimed geek.</h3>
			</div>
			<section id="profile-picture">
				<figure>
					<img src="img/profile-picture-leonidas.jpg" alt="Photo of Leonidas Yopan" id="profile-image"> 
				</figure>
			</section>
			<section id="professional-description">
				<h2>Professional Profile</h2>
				<p>I developed my first websites when I was only 16 years old using plain HTML. I achieved this by opening the website’s source code and testing the code through trial and error. This was an amazing experience to start learning.</p>
				<p>I am 34 years old now, and my skills as a web developer, combined with my capacity for collaborating with other professionals, allows me to be a strong front-end developer.</p>
				<p>Most of my professional life I have owned my own business. I started the first one when I was only 23 years old. It was an English School. Nowadays, besides the English School - I stil own one - I also have a small Video Production company.</p>
				<p>This experience, of owning my own business has allowed me a very indept experience on how to deal with people. From dealing, serving and attending clients to managing and leading our staff. I believe I am a great team worker.</p>

			</section>
			
		</section>		

	</main>

	<footer>
	<?php include $_SERVER['DOCUMENT_ROOT'] . '/common/footer.php'; ?> 
	</footer>

	<!-- Importing FontAwesome icons -->
	<script src="https://kit.fontawesome.com/d92ab94eeb.js"></script>

	<script src="js/home-js.js"></script>
</body>
</html>