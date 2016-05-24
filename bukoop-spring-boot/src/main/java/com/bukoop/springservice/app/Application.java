package com.bukoop.springservice.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

/**
 * Created by haluks on 28/04/16.
 */
@Configuration
@ComponentScan(basePackages = "com.bukoop.springservice.controller")
@EnableJpaRepositories(basePackages = "com.bukoop.springservice.repository")
@EntityScan(basePackages = "com.bukoop.springservice.model")
@Import(RepositoryConfig.class)
@EnableAutoConfiguration
@PropertySources(value = {@PropertySource("classpath:application.properties")})
public class Application extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
