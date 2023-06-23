var requestURL = '/Frontend/certificados.json';

var request = new XMLHttpRequest();

request.open('GET', requestURL);
request.responseType = 'json';
request.send();

request.onload = function () {
    const certificados = request.response;
    showHistorico(certificados);
}


function formatText(jsonObj) {
    let text = '';
  
    for (let prop in jsonObj) {
      text += prop + ': ' + jsonObj[prop] + '<br>   ';
      if(prop.indexOf(prop) % 2) {
        return text + '<br>';
      }
    }
  
    return text;
}


function showHistorico(jsonObj) {
    const historic = document.getElementById("historico");

    jsonObj.forEach(function (certificado) {
        const certificateDiv = document.createElement('div');
        certificateDiv.className = 'certificado';

        const certificateImg = document.createElement('img');
        certificateImg.src = '/Frontend/img/verificado_caixa.png';
        certificateImg.alt = 'Certificado';
        certificateImg.className = 'caixas';

        const certificateName = document.createElement('p');
        certificateName.textContent = certificado.nome;
        certificateName.className = 'certificate-name';

        certificateDiv.appendChild(certificateImg);
        certificateDiv.appendChild(certificateName);

        for (let prop in certificado) {
            if (prop !== 'nome') {
                const infoParagraph = document.createElement('p');
                infoParagraph.className = 'certificate-info'
                infoParagraph.textContent = `${prop}: ${certificado[prop]}`;
                certificateDiv.appendChild(infoParagraph);
                infoParagraph.innerHTML = formatText(certificado);
                
            }
        }

        historic.appendChild(certificateDiv);
    });
}

