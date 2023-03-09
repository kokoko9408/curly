package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criterial {
	
	private int pageNum;
	private int amount;
	private String type; //제목(T), 내용(C), 저자(W)
	private String keyword; //검색 키워드
	
	
	public Criterial() {
		this(1,10); //한 페이지에 1-10까지 10개 씩 보여주겠단 소리
	}
	
	public Criterial(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() { //검색조건을 배열로 만들어서 한 번에 처리하기 위함
		return type == null? new String[] {} : type.split("");
		//타입이 null이면 빈 문자열 생성, null이 아니면 
		
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount",this.getAmount())
				.queryParam("type",this.getType())
				.queryParam("keyword",this.getKeyword());
		
		return builder.toUriString();

	}
}
