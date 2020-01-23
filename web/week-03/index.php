<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home | PHP Shoping Cart</title>

    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/week-03/common/header.php'; ?> 
    </header>
    <main id="main-home">
        <div class="content-width">
            
            <h1>Musical Instruments</h1>

            <h2>Most Popular Instruments</h2>

            <p>Please choose among our amazing selection of musical intruments</p>

            <section id="instruments-list">
            <?php

                $products = array("Acoustic Guitar Beginners", "Acoustic Guitar Premium", "Classic Electric Guitar", "Stylist Electric Guitar", "Modern Ukulele", "Amazing Viola");

                $urls = array("img/acoustic-guitar-01.jpg", "img/acoustic-guitar-02.jpg", "img/guitar-01.jpg", "img/guitar-03.jpg", "img/ukulele-01.jpg", "img/viola-01.jpg");

                $prices = array("115.50", "139.50", "259,50", "189.50", "105.50", "325.50");

            ?>

            <?php
                for ($i=0; $i< count($products); $i++) {
            ?>
            <div class="instrument-offer">
                <figure>
                    <img src="<?php echo($urls[$i]); ?>" alt="<?php echo($products[$i]); ?>" class="instrument-image">
                        <figcaption><?php echo($products[$i]); ?></figcaption>
                    </figure>

                    <div class="price">
                        <p><span class="price-symbol">$</span> <?php echo($prices[$i]); ?></p>
                    </div>
                    <div class="details-cart">
                        <a href="#" class="more-details">More Details</a>
                        <a href="?add=<?php echo($i); ?>" class="add-to-cart"><svg data-name="Layer 2" id="Layer_2" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><title/><path d="M37,88a8,8,0,1,1,8-8A8,8,0,0,1,37,88Zm0-10a2,2,0,1,0,2,2A2,2,0,0,0,37,78Z"/><path d="M63,88a8,8,0,1,1,8-8A8,8,0,0,1,63,88Zm0-10a2,2,0,1,0,2,2A2,2,0,0,0,63,78Z"/><path d="M32,60H66a3.1,3.1,0,0,0,.54,0l.17,0,.35-.11.18-.07a2.43,2.43,0,0,0,.35-.2.33.33,0,0,0,.1-.06,1.8,1.8,0,0,0,.4-.33l.1-.1a1.76,1.76,0,0,0,.24-.3l.1-.15a3.14,3.14,0,0,0,.18-.31c0-.06.05-.11.07-.17l0-.07,13-35A3,3,0,1,0,76.19,21l-1.13,3H24.94l-1.13-3A3,3,0,0,0,21,19H14a3,3,0,0,0,0,6h4.91L29.8,54.31A8,8,0,0,0,32,70H73a3,3,0,0,0,0-6H32a2,2,0,0,1,0-4ZM44,39h3V36a3,3,0,0,1,6,0v3h3a3,3,0,0,1,0,6H53v3a3,3,0,0,1-6,0V45H44a3,3,0,0,1,0-6Z"/></svg></a>
                    </div>
                </div>
            <?php
                }
            ?>

            </section>
        </div>
    </main>
    <footer>
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/week-03/common/footer.php'; ?> 
    </footer>

    <script src="js/application.js"></script>    
</body>
</html>