<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table id="example2" class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Mã cửa hàng</th>
            <th>Tên cửa hàng</th>
            <th>Email cửa hàng</th>
            <th>Phone cửa hàng</th>
            <th>Trạng thái</th>  
            <th style="width: 155px">Tác Vụ</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach var="listShops" items="${requestScope.listSearchShops.content}" varStatus="">
            <tr>
                <td>
                    ${listShops.shopId}
                </td>
                <td>
                    ${listShops.shopName}
                </td>
                <td>
                    ${listShops.userId.email}
                </td>
                <td>
                    ${listShops.shopPhone}
                </td>
                <td>
                    
                    <c:choose>
                        <c:when test="${listShops.userId.enabled==1}">
                            <font style="color: blue"> Hoạt động</font>
                        </c:when>
                        <c:otherwise>
                            <font style="color: red"> Bị khóa</font>
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <div class="btn-group">
                        <button type="button" class="btn btn-info">Tác vụ</button>
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <c:url value="/Supplier/deactiveShop?id=${listShops.shopId}&page=${requestScope.listSearchShops.current}&searchinput=${searchinput}" var="deactive"/>
                            <li><a href="<c:out value="${deactive}"/>">Khóa cửa hàng</a></li>
                            <c:url value="/Supplier/activeShop?id=${listShops.shopId}&page=${requestScope.listSearchShops.current}&searchinput=${searchinput}" var="active"/>
                            <li><a href="<c:out value="${active}"/>">Mở khóa cửa hàng</a></li>
                            <c:url value="/Supplier/setupShowDetailShop?id=${listShops.shopId}&searchinput=${searchinput}" var="showdetailshop"/>
                            <li><a href="<c:out value="${showdetailshop}"/>">Xem chi tiết</a></li>

                            <li class="divider"></li>
                            <li><a href="#">Khác</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>

</table>
