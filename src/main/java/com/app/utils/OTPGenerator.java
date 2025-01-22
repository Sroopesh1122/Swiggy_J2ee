package com.app.utils;
import java.security.SecureRandom;

public class OTPGenerator {
	private static final String CHARACTERS = "0123456789";
    private static final SecureRandom RANDOM = new SecureRandom();

    public static String generateRandomString(int length) {
        StringBuilder stringBuilder = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = RANDOM.nextInt(CHARACTERS.length());
            stringBuilder.append(CHARACTERS.charAt(randomIndex));
        }

        return stringBuilder.toString();
    }
}
