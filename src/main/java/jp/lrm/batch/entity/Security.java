package jp.lrm.batch.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Security")
public class Security {

    @Id
    @Column(name = "securityCode")
    private String securityCode;

    @Column(name = "baseDate")
    private String baseDate;

    @Column(name = "securityName")
    private String securityName;

    public Security() {
    }

    public Security(String baseDate, String securityCode, String securityName) {
        this.baseDate = baseDate;
        this.securityCode = securityCode;
        this.securityName = securityName;
    }

    // Getters and Setters
    public String getBaseDate() {
        return baseDate;
    }

    public void setBaseDate(String baseDate) {
        this.baseDate = baseDate;
    }

    public String getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    public String getSecurityName() {
        return securityName;
    }

    public void setSecurityName(String securityName) {
        this.securityName = securityName;
    }
}
