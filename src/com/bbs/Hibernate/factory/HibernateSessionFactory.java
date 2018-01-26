package com.bbs.Hibernate.factory;

import org.hibernate.SessionFactory;

import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateSessionFactory {
	private static SessionFactory sessionFactory;
	private HibernateSessionFactory(){
		
	}
	
	public static SessionFactory getSessionFactory(){
		if(sessionFactory == null){
			Configuration conf = new Configuration().configure();
			ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(conf.getProperties()).buildServiceRegistry();
			sessionFactory = conf.buildSessionFactory(serviceRegistry);
			return sessionFactory;
		}else{
			return sessionFactory;
		}
	}
}
