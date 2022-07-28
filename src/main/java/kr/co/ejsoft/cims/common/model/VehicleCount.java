package kr.co.ejsoft.cims.common.model;

/**
 * User: Naeyoung Kim
 * Date: 2018-12-24
 */
public class VehicleCount {
	
	private String laneId;
	private int count;
	private String disclosureType;

	public String getLaneId() {
		return laneId;
	}

	public void setLaneId(String laneId) {
		this.laneId = laneId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public String getDisclosureType() {
		return disclosureType;
	}
	
	public void setDisclosureType(String disclosureType) {
		this.disclosureType = disclosureType;
	}
	
}
