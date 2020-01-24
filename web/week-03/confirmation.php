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
                    <h2>Thanks for buying:</h2>

                    <ul>
                <?php                        
                        foreach ( $_SESSION["item"] as $i ) {
                ?>

                <li><?php echo( $_SESSION["quantity"][$i] ); ?> unit(s) of the <strong><?php echo( $products[$_SESSION["item"][$i]] ); ?></strong></li>

                <?php
                    }
                ?>
                    </ul>
                <?php
                }
                ?>

                <h3>Your purschase will be delivered to the following address:</h3>

                <div class="confirmed-address">
                    <p><?=$clientFullName; ?></p>
                    <p><?=$addressOne; ?></p>
                    <p><?=$addressTwo; ?></p>
                    <p><?=$city; ?>, <?=$state; ?></p>
                    <p><?=$zip; ?></p>
                </div>

            </section>
        </div>
    </main>
    <footer>
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/week-03/common/footer.php'; ?> 
    </footer>

    <script src="application.js"></script>    
</body>
</html>