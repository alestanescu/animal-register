
let allAnimals = [];

function getHtmlRegister(animals) {
   return animals.map((animal, i) => {
    return `<tr> 
    <th>${i+1}</th>
    <th>${animal.nrCrotal}Nr. Crotal</th>
    <th>${animal.sex}</th>
    <th>${animal.birthday}</th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
        
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