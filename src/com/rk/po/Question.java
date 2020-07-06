package com.rk.po;

import java.math.BigInteger;

public class Question {

    private BigInteger qid;
    private String qtext;
    private String qa;
    private String qb;
    private String qc;
    private String qd;

    /*	qtype
	    1计算机科学基础知识	10道
	    2信息安全知识		    2道
	    3计算机系统知识		10道
	    4系统开发运行		    10道
	    5面向对象		    5道
	    6数据库			    5道
	    7UML			    5道
	    8数据结构 		    10道
	    9软件工程		    8道
	    10计算机网络		    5道
	    11专业英语		    5道
    */

    private Integer qtype;
    private Integer qanswer;
    private Integer qstate;
    private String qexplain;

    public Integer getQstate() {
        return qstate;
    }

    public void setQstate(Integer qstate) {
        this.qstate = qstate;
    }

    public String getQexplain() {
        return qexplain;
    }

    public void setQexplain(String qexplain) {
        this.qexplain = qexplain;
    }

    public BigInteger getQid() {
        return qid;
    }

    public void setQid(BigInteger qid) {
        this.qid = qid;
    }

    public String getQtext() {
        return qtext;
    }

    public void setQtext(String qtext) {
        this.qtext = qtext;
    }

    public String getQa() {
        return qa;
    }

    public void setQa(String qa) {
        this.qa = qa;
    }

    public String getQb() {
        return qb;
    }

    public void setQb(String qb) {
        this.qb = qb;
    }

    public String getQc() {
        return qc;
    }

    public void setQc(String qc) {
        this.qc = qc;
    }

    public String getQd() {
        return qd;
    }

    public void setQd(String qd) {
        this.qd = qd;
    }

    public Integer getQtype() {
        return qtype;
    }

    public void setQtype(Integer qtype) {
        this.qtype = qtype;
    }

    public Integer getQanswer() {
        return qanswer;
    }

    public void setQanswer(Integer qanswer) {
        this.qanswer = qanswer;
    }
}
