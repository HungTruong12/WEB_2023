
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <script>
            function formatMoney(input) {
                var input = document.getElementById("price");
                // Loại bỏ tất cả các ký tự không phải số
                var value = input.value.replace(/[^\d]/g, '');

                // Chia giá trị thành phần ngàn và phần thập phân
                var parts = value.split('.');
                var integerValue = parts[0];
                var decimalValue = parts.length > 1 ? '.' + parts[1] : '';

                // Định dạng giá trị thành phần ngàn bằng cách thêm dấu chấm sau mỗi 3 chữ số
                var formattedValue = '';
                for (var i = integerValue.length - 1, count = 1; i >= 0; i--, count++) {
                    formattedValue = integerValue.charAt(i) + formattedValue;
                    if (count % 3 === 0 && i > 0) {
                    formattedValue = '.' + formattedValue;
                    }
                }

                // Gán giá trị đã định dạng lại vào input
                input.value = formattedValue + decimalValue;
            }
            window.addEventListener('DOMContentLoaded', formatMoney);
        </script>
        
    </head>
    <body style="text-align: center; border: 2px solid black; height: 30%; width: 30%; margin-left: 38%; margin-top: 2%; padding-bottom: 30px ">
        <h1 style="color: red">Update product</h1>
        <c:if test="${not empty product}">
            <form action="EditProduct" method="POST">
                <input type="hidden" name="action" value="update_sp">
                ID: <input type="text" readonly name="id" value="${product.id}" style="margin-left: 25px;"><br> <br>
                Name: <input type="text" name="name" value="${product.name}" required="" style="margin-left: 4px;"><br> <br>
                Price: <input type="text" id="price" name="price" value="${product.price}" required="" style="margin-left: 9px;" oninput="formatMoney(this)"><br><br>
                Type: <input type="text" name="type" value="${product.type}" required="" style="margin-left: 10px;"><br><br>
                Image: <input type="text" name="image" value="${product.image}" required=""  style="margin-left: 2px;"><br><br>
                <input type="submit" value="Update">
            </form>
        </c:if>
    </body>
</html>
