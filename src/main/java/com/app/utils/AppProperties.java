package com.app.utils;

import java.util.HashMap;
import java.util.Map;

public class AppProperties {
    // Static HashMap to hold properties
    private static Map<String, String> properties = new HashMap<>();

    // Static block to initialize properties
    static {
        properties.put("DB_URL", "");
        properties.put("DB_USERNAME", "");
        properties.put("DB_PASSWORD", "");
        properties.put("CLOUDINARY_CLOUD_NAME", "");
        properties.put("CLOUDINARY_API_KEY", "");
        properties.put("CLOUDINARY_SECRET_KEY", "");
        properties.put("EMAIL", "");
        properties.put("EMAIL_PASSWORD", "");
        properties.put("RAZORPAY_API_KEY", "");
        properties.put("RAZORPAY_SECRET_KEY", "");
        properties.put("SERVER_URL", "");
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


