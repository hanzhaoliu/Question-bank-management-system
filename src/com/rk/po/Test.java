package com.rk.po;

import java.math.BigInteger;
import java.sql.Timestamp;

public class Test {

    private BigInteger tid;
    private String uid;
    private Timestamp ttime;
    private Integer tgrade;

    public BigInteger getTid() {
        return tid;
    }

    public void setTid(BigInteger tid) {
        this.tid = tid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Timestamp getTtime() {
        return ttime;
    }

    public void setTtime(Timestamp ttime) {
        this.ttime = ttime;
    }

    public Integer getTgrade() {
        return tgrade;
    }

    public void setTgrade(Integer tgrade) {
        this.tgrade = tgrade;
    }
}
