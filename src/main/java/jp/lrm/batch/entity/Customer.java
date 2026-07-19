package jp.lrm.batch.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Customer")
public class Customer {

    @Id
    @Column(name = "customerCode")
    private String customerCode;

    @Column(name = "baseDate")
    private String baseDate;

    @Column(name = "customerName")
    private String customerName;

    public Customer() {
    }

    public Customer(String baseDate, String customerCode, String customerName) {
        this.baseDate = baseDate;
        this.customerCode = customerCode;
        this.customerName = customerName;
    }

    // Getters and Setters
    public String getBaseDate() {
        return baseDate;
    }

    public void setBaseDate(String baseDate) {
        this.baseDate = baseDate;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
