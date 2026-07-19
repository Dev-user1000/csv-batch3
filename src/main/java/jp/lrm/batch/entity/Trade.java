package jp.lrm.batch.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Trade")
public class Trade {

    @Id
    @Column(name = "tradeNo")
    private String tradeNo;

    @Column(name = "baseDate")
    private String baseDate;

    @Column(name = "customerCode")
    private String customerCode;

    @Column(name = "securityCode")
    private String securityCode;

    @Column(name = "buySell")
    private String buySell;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "contractDate")
    private String contractDate;

    @Column(name = "settlementDate")
    private String settlementDate;

    public Trade() {
    }

    // Getters and Setters
    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

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

    public String getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    public String getBuySell() {
        return buySell;
    }

    public void setBuySell(String buySell) {
        this.buySell = buySell;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getContractDate() {
        return contractDate;
    }

    public void setContractDate(String contractDate) {
        this.contractDate = contractDate;
    }

    public String getSettlementDate() {
        return settlementDate;
    }

    public void setSettlementDate(String settlementDate) {
        this.settlementDate = settlementDate;
    }
}
