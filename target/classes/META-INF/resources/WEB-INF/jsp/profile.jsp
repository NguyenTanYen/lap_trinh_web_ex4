<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>User Profile - AISolution</title>

<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">
                    <i class="bi bi-person-circle"></i> User Profile
                </h4>
            </div>
            <div class="card-body">
                <!-- Success/Error Messages -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> ${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle"></i> ${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Profile Form -->
                <form action="/profile/update" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <!-- Profile Image Section -->
                        <div class="col-md-4 text-center mb-4">
                            <div class="profile-image-container">
                                <c:choose>
                                    <c:when test="${not empty user.imagePath}">
                                        <img src="/${user.imagePath}" alt="Profile Image" 
                                             class="img-fluid rounded-circle profile-image" 
                                             style="width: 150px; height: 150px; object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="profile-placeholder rounded-circle d-flex align-items-center justify-content-center" 
                                             style="width: 150px; height: 150px; background-color: #e9ecef; margin: 0 auto;">
                                            <i class="bi bi-person" style="font-size: 4rem; color: #6c757d;"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="mt-3">
                                <label for="imageFile" class="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-camera"></i> Change Photo
                                </label>
                                <input type="file" id="imageFile" name="imageFile" 
                                       accept="image/*" class="d-none" onchange="previewImage(this)">
                            </div>
                        </div>

                        <!-- Profile Information -->
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="userId" class="form-label">
                                        <i class="bi bi-person-badge"></i> User ID
                                    </label>
                                    <input type="text" class="form-control" id="userId" 
                                           value="${user.userId}" readonly>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">
                                        <i class="bi bi-envelope"></i> Email
                                    </label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           value="${user.email}" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fullName" class="form-label">
                                        <i class="bi bi-person-badge"></i> Full Name
                                    </label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" 
                                           value="${user.fullName}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone" class="form-label">
                                        <i class="bi bi-telephone"></i> Phone
                                    </label>
                                    <input type="tel" class="form-control" id="phone" name="phone" 
                                           value="${user.phone}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="roleId" class="form-label">
                                        <i class="bi bi-shield-check"></i> Role ID
                                    </label>
                                    <input type="text" class="form-control" id="roleId" 
                                           value="${user.roleId}" readonly>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        <i class="bi bi-info-circle"></i> Status
                                    </label>
                                    <input type="text" class="form-control" 
                                           value="Active User" readonly>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="row mt-4">
                        <div class="col-12 text-end">
                            <a href="/home" class="btn btn-secondary me-2">
                                <i class="bi bi-arrow-left"></i> Back to Home
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-check-lg"></i> Update Profile
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Image Preview Script -->
<script>
function previewImage(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const img = document.querySelector('.profile-image');
            const placeholder = document.querySelector('.profile-placeholder');
            
            if (img) {
                img.src = e.target.result;
            } else if (placeholder) {
                placeholder.innerHTML = '<img src="' + e.target.result + '" alt="Profile Image" class="img-fluid rounded-circle" style="width: 150px; height: 150px; object-fit: cover;">';
            }
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>

<style>
.profile-image-container {
    position: relative;
    display: inline-block;
}

.profile-image {
    border: 3px solid #dee2e6;
    transition: all 0.3s ease;
}

.profile-image:hover {
    border-color: #007bff;
    transform: scale(1.05);
}

.profile-placeholder {
    border: 3px solid #dee2e6;
    transition: all 0.3s ease;
}

.profile-placeholder:hover {
    border-color: #007bff;
}

.form-label {
    font-weight: 500;
    color: #495057;
}

.card {
    border: none;
    border-radius: 15px;
}

.card-header {
    border-radius: 15px 15px 0 0 !important;
}

.btn {
    border-radius: 8px;
    font-weight: 500;
}

.form-control {
    border-radius: 8px;
    border: 1px solid #ced4da;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}
</style>
