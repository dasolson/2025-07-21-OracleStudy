package com.sist.vo;
// Data Transfor Object => VO => Bean...
import java.util.*;

import lombok.Data;
@Data
public class BoardDTO {
    private int no, hit;
    private String name, subject, content, pwd,dbday;
    private Date regdate;
}
