package com.swiggy.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class EmailVerificationStore 
{
    private static List<RequestEmail> requestEmails = new ArrayList<RequestEmail>();
    
    
    public static void addEmail( RequestEmail emilData)
    {
    	requestEmails.add(emilData);
    	requestEmails = requestEmails.stream().map(obj->{
    		if(obj.getEmail().equals(emilData.getEmail()))
    		{
    			return emilData;
    		}else {
    			return obj;
    		}
    	}).collect(Collectors.toList());
    }
    
    public static RequestEmail getOtp(String email) {
        Optional<RequestEmail> optionalEmail = requestEmails.stream()
                .filter(requestEmail -> requestEmail.getEmail().equals(email))
                .findFirst();

        if(optionalEmail.isPresent())
        {
        	return optionalEmail.get();
        }else {
        	return null;
        }
    }
    
    public static void deleteEmailData(String email)
    {
    	requestEmails = requestEmails.stream().filter(obj->!obj.getEmail().equals(email)).collect(Collectors.toList());
    }  
}
