package com.sist.vo;

public class ChartVO {
    private String word;
    private int count;
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ChartVO(String word, int count) {
		//super();
		this.word = word;
		this.count = count;
	}
    public ChartVO() {}
}
