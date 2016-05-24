package com.bukoop.springservice.repository;

import com.bukoop.springservice.model.ProductGroup;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by haluks on 03/05/16.
 */
@RepositoryRestResource
public interface ProductGroupRepository extends CrudRepository<ProductGroup, Integer> {
}
