package com.itwill.willsta.domain;

public class Follow {
	private String mId; 
	private String mIdYou;
	
	
	public Follow(String mId, String mIdYou) {
		super();
		this.mId = mId;
		this.mIdYou = mIdYou;
	}

	
	

	@Override
	public String toString() {
		return "Follow [mId=" + mId + ", mIdYou=" + mIdYou + "]";
	}




	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public String getmIdYou() {
		return mIdYou;
	}


	public void setmIdYou(String mIdYou) {
		this.mIdYou = mIdYou;
	} 
	
	
	
	
	
}
