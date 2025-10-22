package com.sist.vo;
import java.io.*;
import java.util.*;
import lombok.Data;
@Data
// JSP => Bean , MyBatis => DTO , Spring => VO
// JavaScript => Object => {키, 값...}
public class EmpVO {
    private int empno, mgr, sal, comm, deptno;
    private String ename, job, dbday;
    private Date hiredate;
}
