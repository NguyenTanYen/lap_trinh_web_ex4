package com.AISolution.repository.entity;

public class UserEntity {
    private Integer userId;
    private String fullName;
    private String email;
    private String password;
    private Integer roleId;
    private String phone;
    private String imagePath;

    // Constructors
    public UserEntity() {}

    public UserEntity(String fullName, String email, String password, Integer roleId) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.roleId = roleId;
    }

    // Getters and Setters
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "userId=" + userId +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", roleId=" + roleId +
                ", phone='" + phone + '\'' +
                ", imagePath='" + imagePath + '\'' +
                '}';
    }
}
