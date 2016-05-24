package com.bukoop.springservice.repository;

import com.bukoop.springservice.model.SaleDetails;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by haluks on 03/05/16.
 */
public interface SaleDetailsRepository extends CrudRepository<SaleDetails, Integer> {
}
