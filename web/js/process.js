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