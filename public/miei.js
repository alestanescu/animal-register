let allLambs = [];

function getHtmlLambs(animals) {
    return animals.map((animal, i) => {
        return `<tr> 
            <td>${i+1}</td>
            <td>${animal.nrCrotal}</td>
            <td>${animal.motherNrCrotal}</td>
            <td>${animal.sex}</td>
            <td>${animal.birthday}</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>        
            </tr>`
    }).join("")
}

 function showLambs(animals) {
    const html = getHtmlLambs(animals);

    const tbody = document.querySelector("#miei tbody");
    tbody.innerHTML = html;
}
 
function loadLambs() {
    fetch("/registru/miei")
    .then(r => r.json())
    .then(animals => {
        allLambs = animals;
        showLambs(animals);
    });
}
loadLambs();