<?php
// Start the session
session_start();
?>
<?php 
require "application.php"; 

$clientFullName = htmlspecialchars($_POST["clientFullName"]);
$addressOne = htmlspecialchars($_POST["addressOne"]);
$addressTwo = htmlspecialchars($_POST["addressTwo"]);
$state = htmlspecialchars($_POST["state"]);
$city = htmlspecialchars($_POST["city"]);
$zip = htmlspecialchars($_POST["zip"]);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Confirmation | PHP Shoping Cart</title>

    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/week-03/common/header.php'; ?> 
    </header>
    <main id="main-confirmation">
        <div class="content-width">
            <section>

                <h1>Purchase Completed</h1>
                

                <?php
                    if ( isset($_SESSION["item"]) ) {
                ?>

                <p>Thanks for buying <?php echo( $_SESSION["quantity"][$i] ); ?>  <?php echo( $products[$_SESSION["item"][$i]] ); ?>(s) with us today.</p>

                <?php
                    }
                ?>

                <p>You're purschased will be delivered in the following address:</p>

                <p><?php $clientFullName; ?></p>
                <p><?php $addressOne; ?></p>
                <p><?php $addressTwo; ?></p>
                <p><?php $state; ?></p>
                <p><?php $city; ?></p>
                <p><?php $zip; ?></p>

            </section>
        </div>
    </main>
    <footer>
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/week-03/common/footer.php'; ?> 
    </footer>

    <script src="application.js"></script>    
</body>
</html>