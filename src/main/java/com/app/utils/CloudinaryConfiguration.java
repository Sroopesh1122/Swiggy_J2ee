package com.app.utils;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class CloudinaryConfiguration {
	public static Cloudinary getCloudinaryInstance() {
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dwnvbobrq",
                "api_key", "442829252656958",
                "api_secret", "uRHE_kStG0GgSiSCJOr2qSUW5eA"));
    }
}
