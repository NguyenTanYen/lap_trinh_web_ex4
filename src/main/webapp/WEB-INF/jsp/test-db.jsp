<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Database Test - AISolution</title>

<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow">
            <div class="card-header ${status == 'success' ? 'bg-success' : 'bg-danger'} text-white">
                <h4 class="mb-0">
                    <i class="bi bi-database"></i> Database Connection Test
                </h4>
            </div>
            <div class="card-body">
                <div class="alert ${status == 'success' ? 'alert-success' : 'alert-danger'}" role="alert">
                    <h5 class="alert-heading">
                        <i class="bi bi-${status == 'success' ? 'check-circle' : 'exclamation-triangle'}"></i>
                        ${status == 'success' ? 'Success!' : 'Error!'}
                    </h5>
                    <p>${message}</p>
                </div>
                
                <c:if test="${not empty userCount}">
                    <div class="mt-3">
                        <h6>Database Information:</h6>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Users Table
                                <span class="badge bg-primary rounded-pill">${userCount}</span>
                            </li>
                        </ul>
                    </div>
                </c:if>
                
                <div class="mt-4">
                    <a href="/home" class="btn btn-primary">
                        <i class="bi bi-house"></i> Back to Home
                    </a>
                    <a href="/test-db" class="btn btn-outline-primary">
                        <i class="bi bi-arrow-clockwise"></i> Test Again
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
