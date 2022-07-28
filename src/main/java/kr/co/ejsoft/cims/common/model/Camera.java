package kr.co.ejsoft.cims.common.model;

/**
 * User: Naeyoung Kim
 * Date: 2018-12-23
 */
public class Camera {
	private String cameraId;
	private String laneId;
	private String laneName;
	private String operateStDate;
	private String operateEdDate;
	private String operateNewStDate;
	private String operateNewEdDate;
	private String applyFlag;
	private String applyDate;
	private String regDt;
	
	public String getCameraId() {
		return cameraId;
	}
	public void setCameraId(String cameraId) {
		this.cameraId = cameraId;
	}
	public String getLaneId() {
		return laneId;
	}
	public void setLaneId(String laneId) {
		this.laneId = laneId;
	}
	public String getLaneName() {
		return laneName;
	}
	public void setLaneName(String laneName) {
		this.laneName = laneName;
	}
	public String getOperateStDate() {
		return operateStDate;
	}
	public void setOperateStDate(String operateStDate) {
		this.operateStDate = operateStDate;
	}
	public String getOperateEdDate() {
		return operateEdDate;
	}
	public void setOperateEdDate(String operateEdDate) {
		this.operateEdDate = operateEdDate;
	}
	public String getOperateNewStDate() {
		return operateNewStDate;
	}
	public void setOperateNewStDate(String operateNewStDate) {
		this.operateNewStDate = operateNewStDate;
	}
	public String getOperateNewEdDate() {
		return operateNewEdDate;
	}
	public void setOperateNewEdDate(String operateNewEdDate) {
		this.operateNewEdDate = operateNewEdDate;
	}
	public String getApplyFlag() {
		return applyFlag;
	}
	public void setApplyFlag(String applyFlag) {
		this.applyFlag = applyFlag;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
}
