<?php

    $products = array("Acoustic Guitar Beginners", "Acoustic Guitar Premium", "Classic Electric Guitar", "Stylist Electric Guitar", "Modern Ukulele", "Amazing Viola");

    $urls = array("img/acoustic-guitar-01.jpg", "img/acoustic-guitar-02.jpg", "img/guitar-01.jpg", "img/guitar-03.jpg", "img/ukulele-01.jpg", "img/viola-01.jpg");

    $prices = array("115.50", "139.50", "259,50", "189.50", "105.50", "325.50");


    // Inside the session stores the quantity added to each item
    if ( !isset($_SESSION["total"]) ) {
        $_SESSION["total"] = 0;
        for ($i=0; $i< count($products); $i++) {
            $_SESSION["quantity"][$i] = 0;
        }
    }

    // Add item to the cart and count its quantity
    if ( isset($_GET["add"]) ) {
        $i = $_GET["add"];
        $quantity = $_SESSION["quantity"][$i] + 1;
        $_SESSION["item"][$i] = $i;
        $_SESSION["quantity"][$i] = $quantity;
    }

    // Remove item from cart
    if ( isset($_GET["delete"]) ) {
        $i = $_GET["delete"];
        $_SESSION["quantity"][$i] = 0;
        unset($_SESSION["item"][$i]);
    }

    // Subtract 1 item from the item in the cart
    if ( isset($_GET["minus"]) ) {
        $i = $_GET["minus"];
        $quantity = $_SESSION["quantity"][$i];
        $quantity--;
        $_SESSION["quantity"][$i] = $quantity;
    }

    // Add 1 item to the item in the cart
    if ( isset($_GET["plus"]) ) {
        $i = $_GET["plus"];
        $quantity = $_SESSION["quantity"][$i] + 1;
        $_SESSION["item"][$i] = $i;
        $_SESSION["quantity"][$i] = $quantity;
    }


?>
