<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath }/admin/category/add">Add Category</a>
	<table border="1" width="100%">
		<tr>
			<th>STT</th>
			<th>CategoryName</th>
			<th>CategoryID</th>
			<th>Images</th>
			<th>Active</th>
		</tr>
		<c:forEach items="${listcate}" var="cate" varStatus="STT">
			<tr class="odd gradeX">
				<td>${STT.index+1 }</td>
				<td>${cate.categoryName }</td>
				<td>${cate.categoryId }</td>
				<td>
				<c:if test="${cate.image.substring(0,4) != 'http' }">
					<c:url value="/image?fname=${cate.image }" var="imgUrl"></c:url>
				</c:if>
				<c:if test="${cate.image.substring(0,4) == 'http' }">
					<c:url value="${cate.image }" var="imgUrl"></c:url>
				</c:if>
				<img height="150" width="200" src="${imgUrl }" /></td>
				<td>${cate.getActive() == 1 ? 'Hoạt động' : 'Khóa' }</td>
				<td><a
					href="<c:url value='/admin/category/edit?id=${cate.categoryId }'/>"
					class="center">Sửa</a> | <a
					href="<c:url value='/admin/category/delete?id=${cate.categoryId }'/>"
					class="center">Xóa</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>