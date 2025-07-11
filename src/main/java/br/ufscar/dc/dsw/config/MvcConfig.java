package br.ufscar.dc.dsw.config;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import br.ufscar.dc.dsw.conversor.BigDecimalConversor;
import br.ufscar.dc.dsw.conversor.ConsultaConversor;
import br.ufscar.dc.dsw.conversor.MedicoConversor;
import br.ufscar.dc.dsw.conversor.PacienteConversor;

@Configuration
@ComponentScan(basePackages = "br.ufscar.dc.dsw.config")
public class MvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private ConsultaConversor consultaConversor;
	
	@Autowired
	private MedicoConversor medicoConversor;

	@Autowired
	private PacienteConversor pacienteConversor;
	
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("redirect:/home");
		registry.addViewController("/home").setViewName("home");
		registry.addViewController("/index").setViewName("index");
	}

	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver slr = new SessionLocaleResolver();
		slr.setDefaultLocale(new Locale("pt", "BR"));
		return slr;
	}

	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		lci.setParamName("lang");
		return lci;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
	}
	
	@Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new BigDecimalConversor());
        registry.addConverter(medicoConversor);
        registry.addConverter(pacienteConversor);
        registry.addConverter(consultaConversor);
    }
}