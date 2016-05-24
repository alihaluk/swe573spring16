package com.bukoop.springservice.repository;

import com.bukoop.springservice.model.ProductUnit;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by haluks on 02/05/16.
 */
public interface UnitRepository extends CrudRepository<ProductUnit, Integer> {


}
