package com.app.utils;

import java.util.HashMap;
import java.util.Map;

public class AppProperties {
    // Static HashMap to hold properties
    private static Map<String, String> properties = new HashMap<>();

    // Static block to initialize properties
    static {
        properties.put("DB_URL", "jdbc:mysql://localhost:3306/swiggy_db");
        properties.put("DB_USERNAME", "root");
        properties.put("DB_PASSWORD", "root");
        properties.put("CLOUDINARY_CLOUD_NAME", "dwnvbobrq");
        properties.put("CLOUDINARY_API_KEY", "442829252656958");
        properties.put("CLOUDINARY_SECRET_KEY", "uRHE_kStG0GgSiSCJOr2qSUW5eA");
        properties.put("EMAIL", "foodieteam2025@gmail.com");
        properties.put("EMAIL_PASSWORD", "pxkf sfjp mkth nrvh");
        properties.put("RAZORPAY_API_KEY", "rzp_test_LlqzAuvt2E191U");
        properties.put("RAZORPAY_SECRET_KEY", "AVkua6VjB8TbbZiAc34vqQrQ");
        properties.put("SERVER_URL", "http://localhost:8080");
    }

    // Static method to retrieve a property by key
    public static String get(String key) {
        return properties.get(key);
    }

    // Static method to print all properties (optional for debugging)
    public static void printProperties() {
        properties.forEach((key, value) -> System.out.println(key + ": " + value));
    }
}


