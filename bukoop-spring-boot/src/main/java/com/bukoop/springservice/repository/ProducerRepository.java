package com.bukoop.springservice.repository;

import com.bukoop.springservice.model.Producer;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by haluks on 03/05/16.
 */
public interface ProducerRepository extends CrudRepository<Producer, Integer> {
}
