<!DOCTYPE html>
<html>
<head>
    <title>E-commerce Payment</title>
    <script>
        function openPaymentPopup() {
            // URL of the payment page in the bank application
            const paymentUrl = "http://localhost:8080/Swiggy/customer/Payment.jsp";

            // Open a popup window for payment
            const popup = window.open(
                paymentUrl,
                "PaymentPopup",
                "width=600,height=400,scrollbars=yes"
            );

            // Listen for messages from the popup
            window.addEventListener("message", (event) => {
                if (event.data && event.data.status) {
                    if (event.data.status === "success") {
                        alert("Payment Successful! Transaction ID: " + event.data.transactionId);
                    } else {
                        alert("Payment Failed. Please try again.");
                    }
                }
            });
        }
    </script>
</head>
<body>
    <h1>E-commerce Payment</h1>
    <button onclick="openPaymentPopup()">Pay Now</button>
</body>
</html>
