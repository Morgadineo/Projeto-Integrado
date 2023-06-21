const certificateTitle = document.getElementById("titleForm"),
    certificateDesc = document.getElementById("descForm"),
    certificateDate = document.getElementById("dateForm"),
    certificateTime = document.getElementById("timeForm"),
    certificateType = document.getElementById("typeForm"),
    certificateValidation = document.getElementById("validationForm"),
    certificateSubmit = document.getElementById("validationSubmit")

certificateTitle.addEventListener('focusout', inputCheckTitle)
certificateDesc.addEventListener('focusout', inputCheckDesc)
certificateDate.addEventListener('focusout', inputCheckDate)
certificateTime.addEventListener('focusout', inputCheckTime)
certificateType.addEventListener('focusout', inputCheckType)
certificateValidation.addEventListener('focusout', inputCheckValidation)
certificateSubmit.addEventListener('submit', submitJSON)

function inputCheckTitle() {
    if (certificateTitle.value === '') {
        certificateTitle.style = 'border: 1px solid red';
        const pError = document.createElement("p");
        const textError = document.createTextNode("Este campo precisa estar preenchido.")
        pError.appendChild(textError);

        const showText = document.getElementById("title")
        showText.appendChild(pError).style = 'color: red; font-weight: 300;'

    }
}

function inputCheckDesc() {
    if (certificateDesc.value === '') {
        certificateDesc.style = 'border: 1px solid red';
        const pError = document.createElement("p");
        const textError = document.createTextNode("Este campo precisa estar preenchido.")
        pError.appendChild(textError);

        const showText = document.getElementById("desc")
        showText.appendChild(pError).style = 'color: red; font-weight: 300;'
    }
}
function inputCheckDate() {
    if (certificateDate.value === '') {
        certificateDate.style = 'border: 1px solid red';
        const pError = document.createElement("p");
        const textError = document.createTextNode("Este campo precisa estar preenchido.")
        pError.appendChild(textError);

        const showText = document.getElementById("date")
        showText.appendChild(pError).style = 'color: red; font-weight: 300;'
    }
}
function inputCheckTime() {
    if (certificateTime.value === '') {
        certificateTime.style = 'border: 1px solid red';
        const pError = document.createElement("p");
        const textError = document.createTextNode("Este campo precisa estar preenchido.")
        pError.appendChild(textError);

        const showText = document.getElementById("time")
        showText.appendChild(pError).style = 'color: red; font-weight: 300;'
    }
}
function inputCheckType() {
    if (certificateType.value === '') {
        certificateType.style = 'border: 1px solid red';
        const pError = document.createElement("p");
        const textError = document.createTextNode("Este campo precisa estar preenchido.")
        pError.appendChild(textError);

        const showText = document.getElementById("type")
        showText.appendChild(pError).style = 'color: red; font-weight: 300;'
    }
}
function inputCheckValidation() {
    if (certificateValidation.value === '') {
        certificateValidation.style = 'border: 1px solid red';
        const pError = document.createElement("p");
        const textError = document.createTextNode("Este campo precisa estar preenchido.")
        pError.appendChild(textError);

        const showText = document.getElementById("validation")
        showText.appendChild(pError).style = 'color: red; font-weight: 300;'
    }
}

/*
function submitCheck() {
    if (!formSubmit.value) {
        alert("Os campos precisam estar preenchidos.")
        //return false;

    }
    else {
        return submitJSON()
    }


}

function submitJSON() {

    if (certificateSubmit) {

        JSON.parse(formSubmit);
        console.log(formSubmit)
    }

}
*/

function submitJSON(event) {
    event.preventDefault();

    const title = certificateTitle.value;
    const desc = certificateDesc.value;
    const date = certificateDate.value;
    const time = certificateTime.value;
    const type = certificateType.value;
    const validation = certificateValidation.value;

    const formData = {
        titulo: title,
        descricao: desc,
        data: date,
        horas: time,
        tipo: type,
        validacao: validation
    };

    const formDataJSON = JSON.stringify(formData);
    console.log(formDataJSON);
}
