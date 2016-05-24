package com.bukoop.springservice.app;

import com.bukoop.springservice.model.Product;
import com.bukoop.springservice.model.ProductUnit;
import com.bukoop.springservice.model.SaleList;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

/**
 * Created by haluks on 23/05/16.
 */
@Configuration
public class RepositoryConfig extends RepositoryRestMvcConfiguration {

    @Override
    protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
        config.exposeIdsFor(Product.class);
        config.exposeIdsFor(ProductUnit.class);
        config.exposeIdsFor(SaleList.class);
    }
}
