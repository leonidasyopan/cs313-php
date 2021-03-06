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
    <title>Cart | PHP Shoping Cart</title>

    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/week-03/common/header.php'; ?> 
    </header>
    <main id="main-cart">
        <div class="content-width">
            <section>

                <h1>Shopping Cart</h1>

                <?php
                    if ( isset($_SESSION["item"]) ) {
                ?>

                <table class="shopping-cart-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Remove Item</th>
                        </tr>
                    </thead>
                    <tbody>
                <?php
                foreach ( $_SESSION["item"] as $i ) {
                ?>
                    <tr>
                        <td><?php echo( $products[$_SESSION["item"][$i]] ); ?></td>
                        <td><a href="?minus=<?php echo($i); ?>"><svg class="minus-sign" baseProfile="tiny" height="24px" id="Layer_1" version="1.2" viewBox="0 0 20 20" width="20px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M18,11H6c-1.104,0-2,0.896-2,2s0.896,2,2,2h12c1.104,0,2-0.896,2-2S19.104,11,18,11z"/></svg></a> 
                        <?php echo( $_SESSION["quantity"][$i] ); ?> 
                        <a href="?plus=<?php echo($i); ?>"><svg class="plus-sign" height="16px" id="Layer_1" style="enable-background:new 0 0 16 16;" version="1.1" viewBox="0 0 24 24" width="24px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M15,6h-5V1c0-0.55-0.45-1-1-1H7C6.45,0,6,0.45,6,1v5H1C0.45,6,0,6.45,0,7v2c0,0.55,0.45,1,1,1h5v5c0,0.55,0.45,1,1,1h2  c0.55,0,1-0.45,1-1v-5h5c0.55,0,1-0.45,1-1V7C16,6.45,15.55,6,15,6z"/></svg></a></td>
                        <td><a href="?delete=<?php echo($i); ?>">
                        <svg enable-background="new 0 0 512 413.479" height="413.479px" id="Layer_1" version="1.1" viewBox="0 0 512 413.479" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="meanicons_x5F_57"><path d="M391.333-0.478c-66.862,0-121.074,54.189-121.074,121.016c0,66.813,54.211,121.033,121.074,121.033   c3.931,0,7.778-0.229,11.608-0.592c-2.389,13.431-4.662,25.787-6.36,35.008c-0.606,3.024-5.959,8.558-9.041,8.446   c-50.666-1.715-220.176-3.944-220.176-3.944l-56.018-161.99l-3.244-10.946c-0.545-1.509-1.055-2.847-1.375-3.69   c-3.73-9.715-9.973-16.029-15.205-19.756c-5.307-3.783-9.621-5.11-10.213-5.283l-0.16-0.068l-38.772-9.677   c-2.593-5.329-10.757-9.285-20.55-9.285c-11.854,0-21.482,5.747-21.482,12.853c0,7.084,9.628,12.817,21.482,12.817   c3.871,0,7.457-0.628,10.602-1.712L75.07,94.415c0.668,0.257,3.201,1.271,5.959,3.423c3.16,2.384,6.688,6.044,8.918,11.871   c2.961,7.707,18.766,51.449,33.725,92.968c7.498,20.789,14.814,41.132,20.27,56.249c4.74,13.317,8.1,22.615,8.789,24.573   c0.164,0.676,0.572,2.666,0.525,4.965c0.047,2.463-0.402,5.182-1.473,7.305c-1.119,2.145-2.574,3.918-6.063,5.467   c-10.824,4.754-17.168,15.301-17.248,26.265c-0.063,6.856,2.816,14.206,8.818,19.39c5.996,5.147,14.59,7.883,25.092,7.883   c2.83,0,6.807,0,11.631,0l14.289,0.023c-12.102,3.832-20.938,15.002-20.938,28.35c0,16.517,13.416,29.857,29.916,29.857   c16.492,0,29.85-13.342,29.85-29.857c0-13.33-8.775-24.475-20.791-28.322l14.205,0.018c20.063,0.056,42.744,0.092,64.67,0.144   c15.383,0.022,30.34,0.091,43.776,0.091h13.234c-11.57,4.165-19.9,15.086-19.9,28.07c0,16.518,13.377,29.858,29.873,29.858   c16.498,0,29.873-13.342,29.873-29.858c0-12.936-8.27-23.851-19.778-27.99l13.112,0.012c5.045,0,7.922,0,7.922,0   c0.974,0,1.603,0,1.603,0h0.019c4.481,0,8.147-3.586,8.147-8.094c0-4.496-3.646-8.096-8.106-8.145c0,0-187.915-0.457-220.943-0.457   c-7.867-0.018-12.227-1.965-14.51-3.918c-2.232-2.038-3.088-4.25-3.188-7.053c-0.039-4.445,3.02-9.549,7.396-11.328   c6.955-2.92,11.717-7.996,14.25-13.207c1.195-2.502,1.947-4.983,2.434-7.354c1.516,0.362,3.02,0.608,4.621,0.658l212.82,4.343   h0.362c0.123,0,0.224-0.014,0.326-0.014l0.931,0.014h0.405c4.744,0,9.121-1.699,12.545-4.473c3.426-2.735,6.104-6.707,6.908-11.545   l7.707-45.832c54.476-11.803,95.291-60.213,95.291-118.224C512.346,53.714,458.15-0.478,391.333-0.478z M466.784,161.016   l-35.021,35.001l-40.432-40.497L350.9,196.017l-35.062-35.001l40.49-40.479l-40.49-40.479l35.062-34.99l40.432,40.491   l40.432-40.491l35.021,34.99l-40.433,40.479L466.784,161.016z"/></g><g id="Layer_1_1_"/></svg></a>
                        </td>
                    </tr>
                <?php
                        }
                ?>
                        </tbody>
                    </table>
                <?php
                    }
                ?>

                <div class="bottom-buttons">
                    <a href="index.php"><svg height="512px" id="Layer_1" style="enable-background:new 0 0 512 512;" version="1.1" viewBox="0 0 512 512" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><polygon points="352,128.4 319.7,96 160,256 160,256 160,256 319.7,416 352,383.6 224.7,256 "/></svg> Continue Byuing</a>
                    <a href="checkout.php">Checkout Cart <svg height="512px" id="Layer_1" style="enable-background:new 0 0 512 512;" version="1.1" viewBox="0 0 512 512" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><polygon points="160,128.4 192.3,96 352,256 352,256 352,256 192.3,416 160,383.6 287.3,256 "/></svg></a>
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