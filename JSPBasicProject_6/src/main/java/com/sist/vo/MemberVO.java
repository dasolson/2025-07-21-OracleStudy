package com.sist.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 읽기(getter) / 쓰기(setter)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
    private String name;
    private String sex;
    private String address;
    private String phone;
    private boolean admin;
}
