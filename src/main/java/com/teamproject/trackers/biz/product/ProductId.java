package com.teamproject.trackers.biz.product;

import javax.persistence.Embeddable;

@Embeddable
public class ProductId {
    private long p_id;
    private long id;

    public ProductId() {
    }

    public ProductId(long p_id, long id) {
        this.p_id = p_id;
        this.id = id;
    }

    public long getP_id() {
        return p_id;
    }

    public void setP_id(long p_id) {
        this.p_id = p_id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
