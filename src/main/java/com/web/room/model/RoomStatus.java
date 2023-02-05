package com.web.room.model;


public enum RoomStatus {
	空房(0), 已預約(1), 已入住(2);
	private int value;
	RoomStatus(int value){
		this.value=value;
	}
	
	public static RoomStatus from(int value) {
		for (RoomStatus roomStatus : RoomStatus.values()) {
			if(roomStatus.getValue() == value) {
				return roomStatus;
			}
		}
		throw new IllegalArgumentException("Invalid roomStatus :" + value);
		
	}
	public int getValue() {
		return this.value;
	}
		
	
}
