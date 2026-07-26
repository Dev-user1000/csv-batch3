package jp.lrm.batch.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Trade_Info")
public class TradeInfo {

    @Id
    private String tradeNo;

    private String baseDate;
    private String customerCode;
    private String customerName;
    private String securityCode;
    private String securityName;
    private String buySell;
    private Integer quantity;
    private Integer amount;
    private String contractDate;
    private String settlementDate;

    public TradeInfo() {
    }

    public TradeInfo(String baseDate, String tradeNo, String customerCode, String customerName,
                     String securityCode, String securityName, String buySell,
                     Integer quantity, Integer amount, String contractDate, String settlementDate) {
        this.baseDate = baseDate;
        this.tradeNo = tradeNo;
        this.customerCode = customerCode;
        this.customerName = customerName;
        this.securityCode = securityCode;
        this.securityName = securityName;
        this.buySell = buySell;
        this.quantity = quantity;
        this.amount = amount;
        this.contractDate = contractDate;
        this.settlementDate = settlementDate;
    }

    // Getters and Setters
    public String getBaseDate() { return baseDate; }
    public void setBaseDate(String baseDate) { this.baseDate = baseDate; }

    public String getTradeNo() { return tradeNo; }
    public void setTradeNo(String tradeNo) { this.tradeNo = tradeNo; }

    public String getCustomerCode() { return customerCode; }
    public void setCustomerCode(String customerCode) { this.customerCode = customerCode; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getSecurityCode() { return securityCode; }
    public void setSecurityCode(String securityCode) { this.securityCode = securityCode; }

    public String getSecurityName() { return securityName; }
    public void setSecurityName(String securityName) { this.securityName = securityName; }

    public String getBuySell() { return buySell; }
    public void setBuySell(String buySell) { this.buySell = buySell; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Integer getAmount() { return amount; }
    public void setAmount(Integer amount) { this.amount = amount; }

    public String getContractDate() { return contractDate; }
    public void setContractDate(String contractDate) { this.contractDate = contractDate; }

    public String getSettlementDate() { return settlementDate; }
    public void setSettlementDate(String settlementDate) { this.settlementDate = settlementDate; }
}
