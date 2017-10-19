package com.stacktrace.smartscale.model;

public class Scale {
	private String name;
	private String thingId;
	private Double value;
	private Double maxValue;

	public static Scale newScale(String name, String thingId, Double value, Double maxValue) {
		return new Scale(name, thingId, value, maxValue);
	}
	
	private Scale(String name, String thingId, Double value, Double maxValue) {
		this.name = name;
		this.thingId = thingId;
		this.value = value;
		this.maxValue = maxValue;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getThingId() {
		return thingId;
	}

	public void setThingId(String thingId) {
		this.thingId = thingId;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public Double getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(Double maxValue) {
		this.maxValue = maxValue;
	}
}
