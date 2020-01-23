<?php
// Start the session
session_start();
?>
<?php require "application.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Checkout | PHP Shoping Cart</title>

    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/week-03/common/header.php'; ?> 
    </header>
    <main id="main-checkout">
        <div class="content-width">
            <section>

                <h1>Checkout | Provide Address</h1>


                <form action="confirmation.php" method="post" class="address-form">        
                    <fieldset>
                        <legend>All fields are required</legend>
                        
                        <label for="clientFullName">Full Name</label>
                        <input type="text" id="clientFullName" name="clientFullName" required  />

                        <label for="addressOne">Address 1:</label>
                        <input type="text" id="addressOne" name="addressOne" required  />

                        <label for="addressTwo">Address 2:</label>
                        <input type="text" id="addressTwo" name="addressTwo" required  />

                        <label for="state">State:</label>
                        <input type="text" id="state" name="state" required  />

                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" required  />

                        <label for="zip">Zip Code:</label>
                        <input type="text" id="zip" name="zip" required  />
                        
                        <input type="submit" name="submit" value="Confirm" id="confirmButton">
                        
                    </fieldset>                        
                </form>    


                <div class="bottom-buttons">
                    <a href="checkout.php"><svg height="512px" id="Layer_1" style="enable-background:new 0 0 512 512;" version="1.1" viewBox="0 0 512 512" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><polygon points="352,128.4 319.7,96 160,256 160,256 160,256 319.7,416 352,383.6 224.7,256 "/></svg> Return to Cart</a>
                    <a href="confirmation.php">Complete Purchase <svg height="512px" id="Layer_1" style="enable-background:new 0 0 512 512;" version="1.1" viewBox="0 0 512 512" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><polygon points="160,128.4 192.3,96 352,256 352,256 352,256 192.3,416 160,383.6 287.3,256 "/></svg></a>
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