package com.web.mvc.entity;

public class MicroMarket {
    private String zipCode;
    private double radius;
    private double areaLenth;
    private double areaWidth;

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public double getAreaLenth() {
        return areaLenth;
    }

    public void setAreaLenth(double areaLenth) {
        this.areaLenth = areaLenth;
    }

    public double getAreaWidth() {
        return areaWidth;
    }

    public void setAreaWidth(double areaWidth) {
        this.areaWidth = areaWidth;
    }

    @Override
    public String toString() {
        return "MicroMarket{" + "zipCode=" + zipCode + ", radius=" + radius + ", areaLenth=" + areaLenth + ", areaWidth=" + areaWidth + '}';
    }
    
}
