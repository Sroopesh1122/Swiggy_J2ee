package com.app.utils;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class CloudinaryConfiguration {
	public static Cloudinary getCloudinaryInstance() {
		
		
		
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", AppProperties.get("CLOUDINARY_CLOUD_NAME"),
                "api_key", AppProperties.get("CLOUDINARY_API_KEY"),
                "api_secret", AppProperties.get("CLOUDINARY_SECRET_KEY")));
    }
}
