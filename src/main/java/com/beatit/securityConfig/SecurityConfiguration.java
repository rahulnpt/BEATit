package com.beatit.securityConfig;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
//@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Value("${spring.queries.users-query}")
	private String usersQuery;
	
	@Value("${spring.queries.roles-query}")
	private String rolesQuery;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		//for in-memory authentication
		
		//UserBuilder user = User.withDefaultPasswordEncoder();
		/*auth.inMemoryAuthentication()
		.withUser(user.username("rahul").password("krsna").roles("User","Admin"))
		.withUser(user.username("mayank").password("krsna").roles("User"))
		.withUser(user.username("manish").password("krsna").roles("User","Developer"));*/
		
		//for jdbc authentication
		/*auth.jdbcAuthentication()
			.usersByUsernameQuery(usersQuery)
			.authoritiesByUsernameQuery(rolesQuery)
			.dataSource(dataSource)
			.passwordEncoder(passwordEncoder);*/
		
		//jdbc authentication using userDetailService
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
	}
	@Bean(name = BeanIds.AUTHENTICATION_MANAGER)
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/","/register","/js/**","/css/**","/images/**").permitAll()
				.antMatchers("/admin/**").hasRole("Admin")
				.antMatchers("/developer/**").hasRole("Developer")
				.anyRequest().authenticated()
			.and()
				.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/authenticateUser")
				.usernameParameter("email")
				.passwordParameter("password")
				.defaultSuccessUrl("/home")
				.permitAll()
			.and()
				.logout()
				.permitAll();
	}
	
}
