package com.ty.config;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

@Configuration
@ComponentScan(basePackages = "com.ty")
public class FoodAppConfig {
	@Bean(value = "entityManager")
	@Scope(value = "singleton")
	public EntityManager entityManager() {
		return Persistence.createEntityManagerFactory("java").createEntityManager();
	}
}
