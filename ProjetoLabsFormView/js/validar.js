
    var nomeID = document.getElementById("content_txtNome");

    var nome_error = document.getElementById("nome_error");

    nomeID.addEventListener("blur", nameVerify, true);

function Validate() {
    if (nomeID.value == "") {
        nomeID.style.border = "1px solid red";
        nome_error.textContent = "Nome is required";
        nomeID.focus();
        return false;
    }

    if (nomeID.value == "") {
        nomeID.style.border = "1px solid red";
        nome_error.textContent = "Nome is required";
        nomeID.focus();
        return false;
    }


}

function nameVerify() {
    if (nomeID.value !="") {
        nomeID.style.border = "1px solid #5E6E66";
        nome_error.innerHTML = "";
        return true;
    }
}