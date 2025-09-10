<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<form action="${pageContext.request.contextPath }/admin/category/insert" method="post" enctype="multipart/form-data">
  <label for="categoryname">Category name:</label><br>
  <input type="text" id="categoryname" name="categoryname"><br>
  <label for="image">Image:</label><br>
  <img id="images" height="150" width="200" src="${imgUrl }" /><br>
  <input type="file" onchange="chooseFile(this)" id="image" name="image"><br><br>
  <label for="status">Status:</label><br>
  <input type="radio" id="ston" name="status" value="1" checked>
  <label for="html">Đang hoạt động</label><br>
  <input type="radio" id="stoff" name="status" value="0">
  <label for="html">Khóa</label><br>
  <input type="submit" value="Submit">
</form> 