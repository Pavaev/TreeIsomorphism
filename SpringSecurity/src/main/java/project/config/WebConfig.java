package project.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import project.aspectJ.AspectJ;
import project.model.Town;
import project.util.StringToEntityConverter;

import java.util.Locale;

@Configuration
@ComponentScan(basePackages = {"project.controller", "project.service", "project.util"})
@EnableWebMvc
@EnableAspectJAutoProxy
public class WebConfig extends WebMvcConfigurerAdapter {


    @Bean
    public UrlBasedViewResolver setupViewResolver() {
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        resolver.setContentType("text/html; charset=UTF-8");
        resolver.setViewClass(JstlView.class);
        return resolver;
    }




    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/assets/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
    }

    @Bean
    public LocaleResolver localeResolver() {
        CookieLocaleResolver localeResolver = new CookieLocaleResolver();
        localeResolver.setCookieDomain("/");
        localeResolver.setCookieName("lang");
        localeResolver.setDefaultLocale(new Locale("ru"));
        localeResolver.setCookieMaxAge(9999999);
        return localeResolver;


    }

    @Override
    public void addFormatters(FormatterRegistry formatterRegistry) {
        formatterRegistry.addConverter(townGenericConverter());

    }

    @Bean
    public StringToEntityConverter townGenericConverter(){
        return new StringToEntityConverter(Town.class);
    }

    @Bean
    public AspectJ aspectJ(){
        return new AspectJ();
    }

}