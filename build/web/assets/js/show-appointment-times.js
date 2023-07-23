/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.getElementById('selectdentist').addEventListener('change', function () {
    // Lấy giá trị bác sĩ đã chọn
    var selectedDentistId = this.value;
    document.getElementById('appointmentDate').value = '';
    document.getElementById('appointmentTime').innerHTML = '';
    document.getElementById('timeSelection').style.display = 'none';
    // Kiểm tra nếu đã chọn bác sĩ
    if (selectedDentistId) {
        // Hiển thị phần tử chọn ngày hẹn
        document.getElementById('dateSelection').style.display = 'block';
    } else {
        // Nếu không chọn bác sĩ, ẩn phần tử chọn ngày hẹn và phần tử chọn thời gian hẹn
        document.getElementById('dateSelection').style.display = 'none';
        document.getElementById('timeSelection').style.display = 'none';
    }
});

document.getElementById('appointmentDate').addEventListener('blur', function () {
    var selectedDate = this.value;
    var date = new Date(this.value);
    var currentDate = new Date();
    var timeSelect = document.getElementById('appointmentTime');
    timeSelect.innerHTML = '';

    if (selectedDate) {
        // Hiển thị phần tử chọn thời gian hẹn
        document.getElementById('timeSelection').style.display = 'block';
        // Kiểm tra nếu ngày đã chọn đã qua
        if (date < currentDate) {
            alert('Ngày không hợp lệ, vui lòng chọn một ngày khác.');
            this.value = '';
            var defaultOption = document.createElement('option');
            defaultOption.value = '';
            document.getElementById('timeSelection').style.display = 'none';
            return;
        }

        var selectedDentist = document.getElementById('selectdentist').value;
        var startTime, endTime;

        if (date.getDay() === 0 || date.getDay() === 6) {
            startTime = 8;
            endTime = 18;
        } else {
            startTime = 8;
            endTime = 20;
        }
        var defaultOption = document.createElement('option');
        defaultOption.value = '';
        defaultOption.disabled = true;
        defaultOption.selected = true;
        defaultOption.innerText = 'Chọn thời gian';
        timeSelect.appendChild(defaultOption);
        for (let hour = startTime; hour <= endTime; hour++) {
            for (let minute = 0; minute <= 30; minute += 30) {
                let time = ('0' + hour).slice(-2) + ':' + ('0' + minute).slice(-2) + ':' + ('00').slice(-2);
                let option = document.createElement('option');
                option.value = time;
                option.innerText = time;
                let formattedDate = date.toISOString().split('T')[0];
                $.ajax({
                    url: '/SWP391-SE1743/MainController',
                    method: 'POST',
                    data: {
                        action: 'Check Appointment Date',
                        date: formattedDate,
                        time: time,
                        selecteddentist: selectedDentist
                    },
                    success: function (response, status, xhr) {
                        if (xhr.status === 200) {
                            option.disabled = true;
                            option.style.color = 'gray';
                        }
                    },
                    error: function (error) {
                        console.error('Error: ' + error);
                    }
                });
                timeSelect.appendChild(option);
            }
        }
    } else {
        // Nếu không chọn ngày hẹn, ẩn phần tử chọn thời gian hẹn
        document.getElementById('timeSelection').style.display = 'none';
    }
});

