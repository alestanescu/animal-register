
let allAnimals = [];

function getHtmlRegister(animals) {
   return animals.map((animal, i) => {
    return `<tr> 
    <td>${i+1}</td>
    <td>${animal.nrCrotal}Nr. Crotal</td>
    <td>${animal.sex}</td>
    <td>${animal.birthday}</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
        
    </tr>`
}).join("")
}

 function showAnimals(animals) {
    const html = getHtmlRegister(animals);

    const tbody = document.querySelector("#registru tbody");
    tbody.innerHTML = html;
}
 
function loadAnimals() {
    fetch("/registru")
    .then(r => r.json())
    .then(animals => {
        allAnimals = animals;
        showAnimals(animals);
    });
}
loadAnimals();