package com.sist.vo;
import java.util.*;

import lombok.Data;
// 자바 => 조인 (포함 클래스)
@Data
public class EmpVO {
    private int empno, deptno, sal, comm;
    private Date hiredate;
    private String ename, job;
    // 포함 클래스 => has-a
    private DeptVO dvo = new DeptVO();
    private SalGradeVO svo = new SalGradeVO();
}
