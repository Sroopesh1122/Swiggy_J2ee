<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bank Payment Gateway</title>
    <script>
        function processPayment() {
            // Simulate payment processing
            const isSuccess = confirm("Simulate payment: Click OK for success, Cancel for failure.");
            const transactionId = "TXN" + new Date().getTime();

            // Notify the parent window
            if (window.opener) {
                window.opener.postMessage({
                    status: isSuccess ? "success" : "failure",
                    transactionId: isSuccess ? transactionId : null
                }, "*");
            }

            // Close the popup
            window.close();
        }
    </script>
</head>
<body>
    <h1>Bank Payment Gateway</h1>
    <p>Click the button below to process the payment.</p>
    <button onclick="processPayment()">Process Payment</button>
</body>
</html>
