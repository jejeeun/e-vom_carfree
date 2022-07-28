package kr.co.ejsoft.cims.system.model;

public class DBTableUsageInfo {

	private String tableName;
	private String tableComment;
	private String tableRows;
	private String dataSize;
	private String indexSize;
	private String dataFree;
	private String tableDefragment;
	
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getTableComment() {
		return tableComment;
	}
	public void setTableComment(String tableComment) {
		this.tableComment = tableComment;
	}
	public String getTableRows() {
		return tableRows;
	}
	public void setTableRows(String tableRows) {
		this.tableRows = tableRows;
	}
	public String getDataSize() {
		return dataSize;
	}
	public void setDataSize(String dataSize) {
		this.dataSize = dataSize;
	}
	public String getIndexSize() {
		return indexSize;
	}
	public void setIndexSize(String indexSize) {
		this.indexSize = indexSize;
	}
	public String getDataFree() {
		return dataFree;
	}
	public void setDataFree(String dataFree) {
		this.dataFree = dataFree;
	}
	public String getTableDefragment() {
		return tableDefragment;
	}
	public void setTableDefragment(String tableDefragment) {
		this.tableDefragment = tableDefragment;
	}
	
}