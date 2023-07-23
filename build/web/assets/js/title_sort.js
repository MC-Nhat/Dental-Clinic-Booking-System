/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $('#myTable th').click(function () {
        var table = $(this).closest('table');
        var tbody = table.find('tbody');
        var columnIndex = $(this).index();

        // Xác định kiểu sắp xếp (asc/desc) của cột hiện tại
        var currentSortOrder = $(this).hasClass('asc') ? 'desc' : 'asc';

        // Xóa lớp 'asc' và 'desc' khỏi tất cả các cột
        table.find('th').removeClass('asc desc');

        // Thêm lớp tương ứng vào cột hiện tại
        $(this).addClass(currentSortOrder);

        // Sắp xếp các hàng của tbody
        var rows = tbody.find('tr').toArray().sort(comparer(columnIndex, currentSortOrder));
        tbody.empty();

        // Thêm các hàng đã sắp xếp vào tbody
        for (var i = 0; i < rows.length; i++) {
            tbody.append(rows[i]);
        }
    });

    function comparer(index, sortOrder) {
        return function (a, b) {
            var valA = getCellValue(a, index);
            var valB = getCellValue(b, index);

            if (!isNaN(valA) && !isNaN(valB)) {
                // Sắp xếp theo số
                valA = parseFloat(valA);
                valB = parseFloat(valB);
                if (sortOrder === 'asc') {
                    return valA > valB ? 1 : -1;
                } else {
                    return valB > valA ? 1 : -1;
                }
            } else {
                // Sắp xếp theo chữ cái (mặc định)
                valA = valA.toLowerCase();
                valB = valB.toLowerCase();
                if (sortOrder === 'asc') {
                    return valA.localeCompare(valB, undefined, {numeric: true});
                } else {
                    return valB.localeCompare(valA, undefined, {numeric: true});
                }
            }
        };
    }


    function getCellValue(row, index) {
        return $(row).children('td').eq(index).text();
    }
});

