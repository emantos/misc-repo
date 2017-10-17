package com.erle.forms.rest.model;

public class Form {
	private String agency;
	private String classification;
	private String description;
	private String documentNumber;
	private String downloadableLink;
	private String fillableLink;

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
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

}
