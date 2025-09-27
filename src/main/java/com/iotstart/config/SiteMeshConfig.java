package com.iotstart.config;

import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SiteMeshConfig {

    @Bean
    public FilterRegistrationBean<ConfigurableSiteMeshFilter> siteMeshFilter() {
        FilterRegistrationBean<ConfigurableSiteMeshFilter> filter =
                new FilterRegistrationBean<>();
        filter.setFilter(new ConfigurableSiteMeshFilter());
        filter.addUrlPatterns("/*"); // áp dụng cho tất cả URL
        return filter;
    }
}
