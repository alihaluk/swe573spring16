package com.bukoop.springservice.repository;

import com.bukoop.springservice.model.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

/**
 * Created by haluks on 03/05/16.
 */
@RepositoryRestResource
public interface ProductRepository extends CrudRepository<Product, Integer> {

    List<Product> findByProductName(@Param("Name") String searchText);
}
