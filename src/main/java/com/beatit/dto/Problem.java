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
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.Type;

@Entity
@Table(name="problem")
public class Problem {
	
	public Problem() {}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="problem_id")
	private int id;
	
	@Column(name="user_id")
	private int user_id;
	
	@Column(name="user_name")
	private String user_name;
	
	@NotBlank(message="Please provide title to your Problem")
	@Column(name="problem_title")
	private String title;
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Column(name="problem_desc",columnDefinition="LONGTEXT")
	private String description;
	
	@Column(name = "asked_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date askedOn = new Date();
	
	@OneToMany(mappedBy="problem",cascade=CascadeType.ALL)
	private List<Solution> solutionList;

	@ManyToMany(cascade={CascadeType.REFRESH,CascadeType.PERSIST,CascadeType.MERGE})
	@JoinTable(name="problem_concern",
				joinColumns={@JoinColumn(name="problem_id")},
				inverseJoinColumns={@JoinColumn(name="concern_id")})
	private Set<Concern> concerns;

	@Transient
	private String[] concernOptions;
	

	public String[] getConcernOptions() {
		return concernOptions;
	}

	public void setConcernOptions(String[] concernOptions) {
		this.concernOptions = concernOptions;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getAskedOn() {
		return askedOn;
	}

	public void setAskedOn(Date askedOn) {
		this.askedOn = askedOn;
	}

	public List<Solution> getSolutionList() {
		return solutionList;
	}

	public void setSolutionList(List<Solution> solutionList) {
		this.solutionList = solutionList;
	}

	public Set<Concern> getConcerns() {
		return concerns;
	}

	public void setConcerns(Set<Concern> concerns) {
		this.concerns = concerns;
	}
	
}
