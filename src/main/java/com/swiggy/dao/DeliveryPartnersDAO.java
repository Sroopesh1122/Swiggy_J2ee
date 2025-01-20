package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.DeliveryPartners;

public interface DeliveryPartnersDAO {
	
	public DeliveryPartners insertDeliveryPartners(DeliveryPartners d);
	
	public boolean deleteDeliveryPartners(DeliveryPartners d);
	
	public DeliveryPartners updateDeliveryPartners(DeliveryPartners d);
	
	public DeliveryPartners getDeliveryPartners(String email);
	
	public DeliveryPartners getDeliveryPartners(int deliveryPartnerId);
	
	public List<DeliveryPartners> getDeliveryPartners();
	
}
