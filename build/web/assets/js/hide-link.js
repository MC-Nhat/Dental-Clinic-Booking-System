/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.addEventListener('DOMContentLoaded', function () {
    var postLinks = document.querySelectorAll('.post-link');
    postLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            var action = link.getAttribute('data-action');
            submitForm(action);
        });
    });
});

function submitForm(action) {
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'MainController';

    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'action';
    input.value = action;

    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}


