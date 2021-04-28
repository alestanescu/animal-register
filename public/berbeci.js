let allRams = [];

function getHtmlRams(animals) {
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

 function showRams(animals) {
    const html = getHtmlRams(animals);

    const tbody = document.querySelector("#berbeci tbody");
    tbody.innerHTML = html;
}
 
function loadRams() {
    fetch("/registru/berbeci")
    .then(r => r.json())
    .then(animals => {
        allRams = animals;
        showRams(animals);
    });
}
loadRams();