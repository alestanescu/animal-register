let allMothers = [];

function getHtmlMothers(animals) {
    return animals.map((animal, i) => {
        return `<tr> 
            <td>${i+1}</td>
            <td>${animal.nrCrotal}</td>
            <td>${animal.birthday}</td>
            <td>${animal.registrationDate}</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>        
            </tr>`
    }).join("")
}

 function showMothers(animals) {
    const html = getHtmlMothers(animals);

    const tbody = document.querySelector("#mame tbody");
    tbody.innerHTML = html;
}
 
function loadMothers() {
    fetch("/registru/mame")
    .then(r => r.json())
    .then(animals => {
        allMothers = animals;
        showMothers(animals);
    });
}
loadMothers();