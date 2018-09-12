package com.beatit.dto;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.Transient;

@Entity
@Table(name="user")
public class User {

	@Id
	@Column(name="user_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int userId;
	
	@NotEmpty(message="* Please provide your first name")
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Transient
	@Size(min=8,message="* Password must be 8 characters long")
	@NotEmpty(message="* Please provide your password")
	@Column(name="password")
	private String password;
	
	@Email(message="* Please provide a valid email address")
	@NotEmpty(message="* Please provide your email address")
	@Column(name="email")
	private String email;

	@Column(name="enabled")
	private int enabled;
	
	@Column(name = "joined_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date joinOn = new Date();
	
	@ManyToMany(cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinTable(name="user_role",
				joinColumns={@JoinColumn(name="user_id")},
				inverseJoinColumns={@JoinColumn(name="role_id")})
	private Set<Role> roles;
	
	@OneToMany(cascade={CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinColumn(name="problem_id")
	private List<Problem> problems;
	
	@OneToMany(mappedBy="user")
	private List<Solution> solutions;
	
	@ManyToMany(cascade={CascadeType.REFRESH,CascadeType.PERSIST,CascadeType.MERGE})
	@JoinTable(name="user_concern",
				joinColumns={@JoinColumn(name="user_id")},
				inverseJoinColumns={@JoinColumn(name="concern_id")})
	private Set<Concern> concerns;
	
	public Date getJoinOn() {
		return joinOn;
	}

	public void setJoinOn(Date joinOn) {
		this.joinOn = joinOn;
	}

	public Set<Concern> getConcerns() {
		return concerns;
	}

	public void setConcerns(Set<Concern> concerns) {
		this.concerns = concerns;
	}

	public List<Problem> getProblems() {
		return problems;
	}

	public void setProblems(List<Problem> problems) {
		this.problems = problems;
	}

	public List<Solution> getSolutions() {
		return solutions;
	}

	public void setSolutions(List<Solution> solutions) {
		this.solutions = solutions;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
}
