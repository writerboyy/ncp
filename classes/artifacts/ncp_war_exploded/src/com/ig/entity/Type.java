package com.ig.entity;

public class Type {
	private int typeId;// 类别编号
	private String typeName;// 类别名称

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Type(int typeId, String typeName) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
	}

	public Type() {
		super();
	}

	@Override
	public String toString() {
		return "Type [type_id=" + typeId + ", type_name=" + typeName + "]";
	}

}
