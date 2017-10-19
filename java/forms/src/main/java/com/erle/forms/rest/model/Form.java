package com.erle.forms.rest.model;

import java.util.List;

public class Form {
	private String agency;
	private List<String> classification;
	private String description;
	private String documentNumber;
	private String downloadableLink;
	private String fillableLink;
	private String version;

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public List<String> getClassification() {
		return classification;
	}

	public void setClassification(List<String> classification) {
		this.classification = classification;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDocumentNumber() {
		return documentNumber;
	}

	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}

	public String getDownloadableLink() {
		return downloadableLink;
	}

	public void setDownloadableLink(String downloadableLink) {
		this.downloadableLink = downloadableLink;
	}

	public String getFillableLink() {
		return fillableLink;
	}

	public void setFillableLink(String fillableLink) {
		this.fillableLink = fillableLink;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
}
