
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Product</title>
        <script>
            function formatMoney(input) {
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
        </script>
    </head>
    <body style="text-align: center; border: 2px solid black; height: 30%; width: 30%; margin-left: 38%; margin-top: 2%; padding-bottom: 30px ">
        <h1 style="color: red">Add new product </h1>
        <form action="EditProduct" method="post">
            <input type="hidden" name="action" value="add">
            ID: <input type="text" name="id" style="margin-left: 25px; position: relative" required="" ><br> <br>
            Name: <input type="text" name="name" style="margin-left: 4px; position: relative" required=""><br> <br>
            Price: <input type="text" name="price" style="margin-left: 9px; position: relative" required="" oninput="formatMoney(this)"><br><br>
            Type: <input type="text" name="type" style="margin-left: 10px; position: relative" required=""><br><br>
            Image: <input type="text" name="image" style="margin-left: 2px; position: relative"><br><br>
            <input type="submit" value="Save">
        </form>
    </body>
</html>
