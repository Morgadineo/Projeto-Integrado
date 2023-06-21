var requestURL = '/Frontend/certificados.json';

var request = new XMLHttpRequest();

request.open('GET', requestURL);
request.responseType = 'json';
request.send();

request.onload = function () {
    const certificados = request.response;
    headerTable(certificados);
    showTable(certificados);
}

function headerTable(jsonObj) {
    const table = document.getElementById('tabelaCertificados');
    const tr = document.getElementById('tr');
}

function showTable(jsonObj) {
    const table = document.getElementById('tabelaCertificados');
    const tbody = document.createElement('tbody');

    jsonObj.forEach(function (certificado) {
        const tr = document.createElement('tr');

        for (let prop in certificado) {
            const td = document.createElement('td');
            td.textContent = certificado[prop];
            tr.appendChild(td);
        }

        tbody.appendChild(tr);
    });

    table.appendChild(tbody);
}
